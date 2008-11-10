require File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb")

describe "Relevance::Tarantula::UnexpectedUrlHandler" do
  before do
    @handler = Relevance::Tarantula::UnexpectedUrlHandler.new(/bad\/page/)
  end

  it "likes a page with a url that doesn't match" do
    result = Relevance::Tarantula::Result.new(:response => stub(), :url => '/users/peter_parker')
    @handler.handle(result).should == nil
  end

  it "rejects a page with a url that matches" do
    result = Relevance::Tarantula::Result.new(:response => stub(), :url => '/this/is/a/bad/page')
    result = @handler.handle(result)
    result.should.not.be nil
    result.data.should =~ /Error: Unexpected URL reached: '\/this\/is\/a\/bad\/page'/
    result.description.should == "Unexpected URL"
  end

end
