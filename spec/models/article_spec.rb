require 'spec_helper'

describe Article do
  describe 'validate test' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :text}
    it {should validate_length_of(:title).is_at_most(140)}
    it {should validate_length_of(:text).is_at_most(4000)}
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

describe '#last_comment' do
  it 'returns last comment' do
    article = create(:article_with_comments)
    expect(article.last_comment.body).to eq "comment body 3"
  end


end