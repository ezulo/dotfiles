## Load autoconfig.yml
config.load_autoconfig(True)
c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}
c.backend = 'webengine'
c.changelog_after_upgrade = 'patch'
c.url.searchengines = {'DEFAULT': 'https://search.brave.com/search?q={}&source=web'}
c.url.start_pages = ['https://search.brave.com/']
c.downloads.location.directory = '$HOME/Downloads'
c.colors.webpage.bg = 'black'
c.colors.webpage.darkmode.enabled = True
c.content.user_stylesheets = [
    'styles/darkmode-links.css'
]

