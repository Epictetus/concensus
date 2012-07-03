# Concensus

Concensus is a gem for reading the United States Census Bureau's [TIGER/Line Shapefiles](http://www.census.gov/geo/www/tiger/).

It uses the [georuby](http://rubygems.org/gems/georuby) gem to convert the shapefiles, which leaves you with access to all of the methods in the [georuby API](http://www.ruby-doc.org/gems/docs/g/georuby-1.9.7/GeoRuby/SimpleFeatures/MultiPolygon.html).

## Install

    gem 'concensus'


## Use

	Concensus::Place.find("CA", "Berkeley")
		=> #<Concensus::Place>
		
	Concensus::Place.find_all("CA")
		=> [#<Concensus::Place>, #<Concensus::Place>, etc...]	
	
	california = Concensus::State.find("CA")
	
	california.geometry
		=> #<GeoRuby::SimpleFeatures::MultiPolygon>
	
	california.geometry.to_array
		=> [[[-119.000932, 33.535895], [-119.000932, 33.535823], [-118.997845, 33.534199], [-118.994453, 33.532711], [-118.992796, 33.531849], [-118.990046, 33.530288999999996], [-118.986199, 33.527425], ...], ...]
		
	california.geometry.to_array[0]
		=> [[-119.000932, 33.535895], [-119.000932, 33.535823], ... ] 
		

### List of Resources

<table style="text-align: left;" cellpadding="5" border="1">
	<tr>
		<th></th>
		<th>2011</th>
		<th>2010</th>
	</tr>
    <tr>
        <th>Concensus::Place</th>
        <td>✓</td>
        <td>✓</td>
    </tr>
    <tr>
    	<th>Concensus::County</th>
    	<td></td>
    	<td>✓</td>
    </tr>
    <tr>
    	<th>Concensus::State</th>
    	<td></td>
    	<td>✓</td>
    </tr>
    <tr>
    	<th>Concensus::School::Elementary</th>
    	<td>✓</td>
    	<td>✓</td>
    </tr>
    <tr>
    	<th>Concensus::School::Secondary</th>
    	<td>✓</td>
    	<td>✓</td>
    </tr>
    <tr>
    	<th>Concensus::School::Unified</th>
    	<td>✓</td>
    	<td>✓</td>
    </tr>
    <tr>
    	<th>Concensus::StateLegislative::Upper</th>
    	<td>✓</td>
    	<td>✓</td>
    </tr>
    <tr>
    	<th>Concensus::StateLegislative::Lower</th>
    	<td>✓</td>
    	<td>✓</td>
    </tr>
    <tr>
    	<th>Concensus::Congressional</th>
    	<td></td>
    	<td>✓</td>
    </tr>
</table>



### Full Documentation
[http://rubydoc.info/github/adamjacobbecker/concensus/](http://rubydoc.info/github/adamjacobbecker/concensus/)

### Notes

Some of the .zip files downloaded are quite large, so this gem requires temporary storage to unzip and cache the downloaded files. By default, we store these in `~/.concensus/tmp/`.

If you're using Rails, you'll probably want to create an initializer with `Concensus.configure { |c| c.tmp_dir = "#{Rails.root}/tmp/concensus/" }`. This way, you can use Concensus with the (very temporary) writable storage on Heroku.

#### Todo

- Add more geographic areas, we only have a small bit of [what's available](http://www.census.gov/geo/www/tiger/tgrshp2010/availability.html).
- Add support for storing downloaded and uncompressed .zips on S3. (Heroku has no persistent writable file storage.)

**Support development by sending links to siiick house mixes:** [@AdamJacobBecker](http://www.twitter.com/AdamJacobBecker)