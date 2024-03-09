# frozen_string_literal: true

blog_versions = [
  {
    content: "<div>\n  <h1>Welcome to Blinkist!</h1>\n  <p>Blinkist is a platform that distills key insights from " \
    "outstanding nonfiction books. See how it can redefine your reading routines...</p>\n  " \
    "<button id='signup' class='bg-green-800 text-white px-5 py-2 rounded'>Sign up</button>\n</div>\n"
  },
  {
    content: "<div>\n  <h1>Start Learning with Blinkist</h1>\n  <p>Gain key insights from the world's best nonfiction " \
    "books with Blinkist. Transform your journeys into learning opportunities ...</p>\n  " \
    "<button id='signup' class='bg-green-800 text-white px-5 py-2 rounded'>Sign up</button>\n</div>"
  },
  {
    content: "<div>\n  <h1>Explore Books Differently with Blinkist</h1>\n  <p>Blinkist provides concise overviews of " \
    "notable nonfiction books. Make the most of your time by learning vital insights efficiently...</p>\n  " \
    "<button id='signup' class='bg-green-800 text-white px-5 py-2 rounded'>Sign up</button>\n</div>"
  }
]

blog_versions.each do |version|
  Version.create!(content: version[:content])
end
