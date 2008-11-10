class Relevance::Tarantula::UnexpectedUrlHandler 
  
  def initialize(pattern_that_tarantula_should_not_see_in_a_url)
    @pattern = pattern_that_tarantula_should_not_see_in_a_url
  end
  
  def handle(result)
    if result.url =~ @pattern
      error_result = result.dup
      error_result.description = "Unexpected URL"
      error_result.data = "Error: Unexpected URL reached: '#{result.url}'"
      return error_result
    end
  end
end
