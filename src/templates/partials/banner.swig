<div id="banner"
	{% if featuredImage && featuredImage.fields || featuredImageURL %}
		class="banner-background" 
		style="background-image:url('{{featuredImage.fields.file.url|default(featuredImageURL)}}?w=1920&amp;q=50')"
	{% endif %}
>
</div>
<div class="header">
	<div class="container">
	{% if featuredImage && featuredImage.fields || featuredImageDescription %}
	<div class="image-attribution">
		<p>{{featuredImage.fields.description|default(featuredImageDescription)|autolinker}}</p>
	</div>
	{% endif %}
</div>
<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<h1 class="page-title">{{ title }}</h1></div>
	</div>
</div>