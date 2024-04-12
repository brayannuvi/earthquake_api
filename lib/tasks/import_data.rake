namespace :import_data do
    desc "Import earthquake features"
    task earthquake: :environment do
        require 'net/http'
        require 'json'

        url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)

        data['features'].map do |api_feature|
            feature_id = api_feature['id']
            feature_properties = api_feature['properties']
            next puts "coordinates can't be blank" if api_feature['geometry'].blank? || api_feature['geometry']['coordinates'].blank?
            feature = Feature.create( external_id: feature_id,
                                    magnitude: feature_properties['mag'],
                                    place: feature_properties['place'],
                                    time: feature_properties['time'],
                                    external_url: feature_properties['url'],
                                    tsunami: feature_properties['tsunami'],
                                    mag_type: feature_properties['magType'],
                                    title: feature_properties['title'],
                                    longitude: api_feature['geometry']['coordinates'][0],
                                    latitude: api_feature['geometry']['coordinates'][1]
                                    )
            puts "#{feature.external_id} #{feature.errors.full_messages}" unless feature.persisted?
        end
    end
end
