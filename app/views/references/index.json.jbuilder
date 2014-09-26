json.array!(@references) do |reference|
  json.extract! reference, :id, :ref_no, :note1, :note2, :note3
  json.url reference_url(reference, format: :json)
end
