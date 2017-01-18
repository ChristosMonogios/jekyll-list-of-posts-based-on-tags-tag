module Jekyll
    require 'time'
    class ListOfPostsBasedOnTag < Liquid::Tag
        def initialize(tag_name, numberOfPostsToShow, tokens)
            super
            @numberOfPostsToShow = numberOfPostsToShow.to_i
        end

        def render(context)
            html = ""
            pageTags = context.environments.first["page"]["tags"]
            baseUrl = context.registers[:site].config['baseurl']
            posts = []

            for tag in pageTags
                posts += context.registers[:site].tags[tag]
            end

            # TODO: Select the numberOfPostsToShow posts randomly from the array

            posts = posts.slice(0, @numberOfPostsToShow)

            for post in posts
                time = post.data["date"].to_datetime.strftime("%d %b %Y")
                timeForUrl = post.data["date"].to_datetime.strftime("%Y/%m/%d/")
                html += "<li>"\
                            "<h4>"\
                                "<a href=\"#{baseUrl}#{timeForUrl}#{post.data['slug']}\">"\
                                    "#{post.data['title']}"\
                                    "<small><time datetime=\"#{time}\"> #{time}</time></small>"\
                                "</a>"\
                            "</h4>"\
                        "</li>"
            end

            return html
        end
    end
end

Liquid::Template.register_tag('relevant_posts_list', Jekyll::ListOfPostsBasedOnTag)