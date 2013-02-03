require 'html/pipeline'

ArticlePipeline = HTML::Pipeline.new([
  HTML::Pipeline::MarkdownFilter,
  HTML::Pipeline::SanitizationFilter,
  HTML::Pipeline::ImageMaxWidthFilter,
  HTML::Pipeline::HttpsFilter
])
