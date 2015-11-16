require('dotenv').load()


var express = require('express')
var app = express()
var swig = require('swig')
    require('./lib/swig-filters')(swig)
var engines = require('consolidate')
var contentful = require('contentful');
var parseHTML = require('./lib/parseHTML')

var https = require("https");


var client = contentful.createClient({
  // ID of Space 
  space: process.env.CONTENTFUL_SPACE,
 
  // A valid access token within the Space 
  accessToken: process.env.CONTENTFUL_PREVIEW_ACCESS_TOKEN,
 
  // Enable or disable SSL. Enabled by default. 
  secure: true,
 
  // Set an alternate hostname, default shown. 
  host: 'preview.contentful.com',
 
  // Resolve links to entries and assets 
  resolveLinks: true
});

// This is where all the magic happens!
app.engine('swig', engines.swig);

app.set('view engine', 'swig');
app.set('views', __dirname + '/templates');

// Swig will cache templates for you, but you can disable
// that and use Express's caching instead, if you like:
app.set('view cache', false);
// To disable Swig's cache, do the following:
swig.setDefaults({ cache: false });
// NOTE: You should always cache templates in a production environment.
// Don't leave both of these to `false` in production!


app.use('/scripts',express.static('dest/scripts'));
app.use('/styles',express.static('dest/styles'));
app.use('/images',express.static('dest/images'));


app.get('/', function (req, res) {

    client.contentTypes()
    .then(function(contentTypes){
        res.render('server/stagingHome',{
            title: "Giving What We Can Staging",
            contentTypes: contentTypes
        });
    })
});

app.get('/rebuild', function (req, res) {

    var url = require("url").parse(process.env.NETLIFY_WEBHOOK);
    console.log(url)
    var options = {
        hostname: url.hostname,
        port: 443,
        path: url.path,
        method: 'POST'
    };

    var request = https.request(options, function(response) {
        response.on('end',function(){
            res.render('server/rebuild',{
                response: response
            });
        })

    });
    request.on('error', function(e) {
      console.error(e);
    });
    request.write('');
    request.end();
});

app.get('/:contentType', function (req, res) {
    var contentType = req.params.contentType
    var contentTypeName

    client.contentTypes()
    .then(function(contentTypes){
        for (var i = contentTypes.length - 1; i >= 0; i--) {
            if(contentTypes[i].sys.id === contentType){
                contentTypeName = contentTypes[i].name
                break
            }
        };
        if(contentTypeName){
            client.entries({
                content_type: contentType,
                order: '-sys.updatedAt'
            })
            .then(function(entries){
                res.render('server/listEntries',{
                    contentType: contentType,
                    contentTypeName: contentTypeName,
                    entries: entries
                });
            })
        } else {
            res.send('No content type matches ' + contentType)
        }
    })
});

app.get('/:contentType/:contentID', function (req, res) {
    var contentType = req.params.contentType
    var contentID = req.params.contentID
    var contentTypeName, templateName

    client.contentTypes()
    .then(function(contentTypes){
        for (var i = contentTypes.length - 1; i >= 0; i--) {
            if(contentTypes[i].sys.id === contentType){
                contentTypeName = contentTypes[i].name
                break
            }
        };
        if(contentTypeName){
            templateName = contentTypeName.toLowerCase()
            client.entry(contentID)
            .then(function(entry){
                var entryData = entry.fields
                entryData.contents = parseHTML(entryData.contents,templateName+'s')
                res.render(templateName,entryData);
            })
        } else {
            res.send('No content type matches ' + contentType)
        }
    })
});


app.listen(1337);
console.log('Application Started on http://localhost:1337/');