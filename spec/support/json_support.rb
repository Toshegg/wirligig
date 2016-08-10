shared_examples_for 'success API response' do
  it 'should be success response' do
    expect(response.status).to eq 200
  end

  it 'should have JSON content type' do
    expect(response.content_type).to eq Mime::JSON
  end
end

shared_examples_for 'success DELETE response' do
  it 'should be success response' do
    expect(response.status).to eq 204
  end
end

