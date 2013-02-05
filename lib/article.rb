require './lib/article_pipeline'

class Article

  DIR = File.expand_path('../../articles', __FILE__)

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def dir
    File.dirname(path)
  end

  def slug
    File.basename(path, '.md')
  end

  def body
    document.to_s
  end

  def document
    ArticlePipeline.call(raw)[:output]
  end

  def raw
    File.read(path)
  end

  def title
    document.css('h1:first').text
  end

  def category
    @category ||= Category.new(dir)
  end

  def mtime
    cmd = Shellwords.join(['git', 'log',
      '--diff-filter=M',
      '--format="format:%ad"',
      '--date=iso',
      '--',
      path]
    )
    puts cmd
    Time.parse(`#{cmd}`)
  end

end
