{% include "./calculatorControls.swig" %}

<hr>

<div class="noscript">
	<div class="row">
		<div class="col-xs-12">
			<p>The Calculator requires Javascript to be enabled.</p>
		</div>
	</div>
</div>

<div id="calculator-body" class="onlyscript calculated">

	<div class="row show-calculating">
		<div class="col-md-6 col-md-offset-3">
			<p class="">
				Calculating...
			</p>
		</div>
	</div>

	<div class="row show-calculated explanatory-interstitial" id="calculation-details">
		<div class="col-sm-12">
			<p>
				If you live in
				<span class="number country"></span>
				with a household income of
				<span class="number"><span class="income"></span> <span class="currency"></span></span>
			</p>
			<p> and your household has
				<span class="number">
					<span class="adults"></span> adults
					<span class="if-children">and <span class="children"></span> children</span>&nbsp;&hellip;
				</span>
			</p>
		</div>
	</div>

	<div class="row show-calculated" id="comparisons-before">
		<div class="col-sm-6">
			<div class="calculator-comparison percentile">
				<p>&hellip;&nbsp;you are in the <span class="number">richest <span class="richest-percentile"></span>%</span> of the world's population</p>
			</div>
			<div id="chart-percentile" class="ct-octave"></div>
		</div>
		<div class="col-sm-6">
			<div class="calculator-comparison multiple">
				<p>Your income is more than <span class="number"><span class="global-average-multiple"></span> times</span> the global median.</p>
			</div>
			<div id="chart-multiple" class="ct-octave"></div>
		</div>
	</div>

	<div class="row show-calculated explanatory-interstitial" id="donation-amount">
		<div class="col-xs-12">
			<p><span class="slabtext">If you donated <strong><span class="donation-percentage"></span>%</strong> of your income....</span></p>
			<input name="donationpercentage" data-slider-id='donation-percentage-control' type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="10">
		</div>
	</div>

	<div class="row show-calculated" id="comparisons-after">
		<div class="col-sm-6">
			<div class="calculator-comparison percentile-after-donating">
				<p>... you would still be in the <span class="number">richest <span class="richest-percentile-after-donating"></span>%</span> of the world's population ...</p>
			</div>
			<div id="chart-percentile-after-donating" class="ct-octave"></div>
		</div>
		<div class="col-sm-6">
			<div class="calculator-comparison multiple-after-donating">
				<p>... you'd still have more than <span class="number"><span class="global-average-multiple-after-donating"></span> times</span> the global median income...</p>
			</div>
			<div id="chart-multiple-after-donating" class="ct-octave"></div>
		</div>
	</div>

	<div class="row show-calculated explanatory-interstitial" id="each-year">
		<div class="col-sm-12">
			<p><span class="slabtext">And each year your donations could fund&nbsp;&hellip;</span></p>
		</div>
	</div>

	<div class="row show-calculated">
		<div class="col-sm-4">
			<div class="calculator-outcome nets-wrapper">
				<p>&hellip;&nbsp;the distribution of <span class="number"><i class="icon icon-mosquito-net"></i> <span class="nets"></span></span> insecticide treated bednets&nbsp;&hellip;</p>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="calculator-outcome dewormingtreatments-wrapper">
				<p>&hellip;&nbsp;or more than <span class="number"><i class="icon icon-pills"></i> <span class="dewormingtreatments"></span></span> schistosomiasis treatments&nbsp;&hellip;</p>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="calculator-outcome lives-wrapper">
				<p>&hellip;&nbsp;equivalent to saving <span class="number"><i class="fa fa-users"></i> <span class="lives"></span></span><span class="lives-unit"></span></p>
				<p>Amazing, right?</p>
			</div>
			<div class="calculator-outcome dalys-wrapper">
				<p>&hellip;&nbsp;equivalent to saving <span class="number"><i class="fa fa-users"></i> <span class="dalys"></span></span> <span class="dalys-unit"></span> of healthy life.</p>
				<p>Amazing, right?</p>
			</div>
		</div>
	</div>

	<div class="row show-calculated explanatory-interstitial" id="call-to-action">
		<div class="col-sm-12">
			<p class="challenge">Interested in helping?</p>
			<p class="action make-slabtext"><span class="slabtext">Consider taking our <a href="/pledge">10% pledge</a></span></p>
		</div>
	</div>



	<div class="row show-calculated">
		<div class="col-sm-4 calculator-action">
			<p>Let's do this!</p>
			<a href="/get-involved/become-member" class="btn btn-success">Become a member</a>
		</div>
		<div class="col-sm-4 calculator-action">
			<p>Got more info?</p>
			<a href="/get-involved/what-we-can-achieve" class="btn btn-info">Learn about making a <em>real</em>&nbsp;difference</a>
		</div>
		<div class="col-sm-4 calculator-action">
			<p>Ready to pledge&hellip;</p>
			<a href="/get-involved/try-giving" class="btn btn-default">Try&nbsp;Giving</a>
			<!--<p>I'm not convinced&hellip;</p>
			<a href="/get-involved/10-reasons-to-join" class="btn btn-default">Give me 10 good&nbsp;reasons</a>-->
		</div>
	</div>

	<div class="row show-calculated" id="back-to-top">
		<div class="col-sm-8 col-sm-offset-2">
			<hr>
			<a href="#" class="back-to-calculator btn btn-default">
				<i class="fa fa-chevron-up"></i><br>
				Back to the calculator
			</a>
		</div>
	</div>

</div>

<!-- MODAL -->

<div class="modal fade" id="sharing-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Before you go, why not share your results?</h4>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-lg-6">
      			<div class="og-image">
      				<p>
	      				<img src="https://www.givingwhatwecan.org/sites/givingwhatwecan.org/files/attachments/How-Rich-Am-I---OpenGraph.jpg" class="img-responsive">
	      			</p>
      			</div>
      		</div>
      		<div class="col-lg-6">
		      	<p>
		      		<a class="btn btn-primary facebook btn-lg" href="https://www.facebook.com/sharer/sharer.php?u={url}">
		      			<i class="fa fa-facebook"></i> Share on Facebook
		      		</a>
		      	</p>
		      	<p>
		      		<a class="btn btn-primary twitter btn-lg" href="https://twitter.com/intent/tweet?text={text}&amp;url={url}&amp;via=givingwhatwecan">
		      			<i class="fa fa-twitter"></i> Share on Twitter
		      		</a>
		      	</p>
		      	<p>
		      		<a class="btn btn-primary google-plus btn-lg" href="https://plus.google.com/share?url={url}">
		      			<i class="fa fa-google-plus"></i> Share on Google+
		      		</a>
		      	</p>
	        </div>
      	</div>
				<div class="row">
					<div class="col-lg-12">
					    <div class="input-group">
					    	<span class="input-group-addon"><i class="fa fa-link"></i> Link:</span>
					    	<input class="input-lg form-control get-link" value="">
					    </div>
					</div>
				</div>
    	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">No thanks</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
