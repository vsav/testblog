require 'spec_helper'

describe Article do
  describe 'validate test' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :text}
  end
  describe 'association test' do
    it {should have_many :comments}
  end
end

describe '#subject' do
  it 'returns the article title' do

    #создаем article хитрым способом, нужен gem - factory girl

    article = create(:article, title: 'Lorem Ipsum')

    #assert, проверка

    expect(article.subject).to eq 'Lorem Ipsum'

  end

end