json.array!(@numbers) do |number|
  json.extract! number, :id, :prime
  json.url number_url(number, format: :json)
end
