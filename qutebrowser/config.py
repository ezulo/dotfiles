## Load autoconfig.yml
config.load_autoconfig(True)
c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}
c.auto_save.interval = 15000
c.auto_save.session = True
c.backend = 'webengine'
c.changelog_after_upgrade = 'patch'
c.url.searchengines = {'DEFAULT': 'https://www.startpage.com/do/search?query={}'}
c.url.start_pages = ['https://www.startpage.com/']
c.downloads.location.directory = '$HOME/downloads'

