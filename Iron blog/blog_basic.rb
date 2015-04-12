class Blog
	attr_accessor :container
	def initialize
		@container = []
	end

	def publish
		@container.sort!{|x,y| x.date <=> y.date}

		@container.each do |z|
			puts "\n #{z.title}  //  #{z.date}"
			puts "**************"
			puts "#{z.text}"
			puts "-------------- \n"
		end
	end
end

class Post
	attr_accessor :title, :date, :text
	def initialize title, date, text
		@title=title
		@date=date
		@text=text
	end
end

blog = Blog.new()
post1 = Post.new("Titulo 1", "03/08/2013", "Texto 1")
post2 = Post.new("Titulo 2", "21/05/2014", "Texto 2")
post3 = Post.new("Titulo 3", "17/10/2013", "Texto 3")

blog.container.push(post1)
blog.container.push(post2)
blog.container.push(post3)

blog.publish