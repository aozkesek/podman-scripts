# -*- python -*-
# ex: set filetype=python:

from buildbot.plugins import *

# This is a sample buildmaster config file. It must be installed as
# 'master.cfg' in your buildmaster's base directory.

# This is the dictionary that the buildmaster pays attention to. We also use
# a shorter alias to save typing.
c = BuildmasterConfig = {}

####### WORKERS

# The 'workers' list defines the set of recognized workers. Each element is
# a Worker object, specifying a unique worker name and password.  The same
# worker name and password must be configured on the worker.
c['workers'] = [worker.Worker("localworker", "local")]

# 'protocols' contains information about protocols which master will use for
# communicating with workers. You must define at least 'port' option that
# workers could connect to your master with this protocol.
# 'port' must match the value configured into the workers (with their
# --master option)
c['protocols'] = {'pb': {'port': 9989}}

####### CHANGESOURCES

# the 'change_source' setting tells the buildmaster how it should find out
# about source code changes.  Here we point to the buildbot version of a
# python hello-world project.


c['change_source'] = []

####### SCHEDULERS

# Configure the Schedulers, which decide how to react to incoming changes.  
# In this case, just kick off a 'runtests' build

hourly_gitfetch = schedulers.Periodic(name="hourly_git_fetch", 
					builderName="build_rbt", 
					periodicBuildTimer=3600)
build_rbt = util.BuilderConfig(name="build_rbt",
				workernames=["localworker"],
				factory=factory)
c['schedulers'] = [hourlyGitFetch]

####### BUILDERS

# The 'builders' list defines the Builders, which tell Buildbot how to perform
# a build: what steps, and which workers can execute them.  Note that any
# particular build will only take place on one worker.
factory = util.BuildFactory()

c['builders'] = []
c['builders'].append()

####### BUILDBOT SERVICES

# 'services' is a list of BuildbotService items like reporter targets. The
# status of each build will be pushed to these targets. buildbot/reporters/*.py
# has a variety to choose from, like IRC bots.

c['services'] = []

####### PROJECT IDENTITY

# the 'title' string will appear at the top of this buildbot installation's
# home pages (linked to the 'titleURL').

c['title'] = "DEVOP-CI"
c['titleURL'] = "http://localhost:8010/"

# the 'buildbotURL' string should point to the location where the buildbot's
# internal web server is visible. This typically uses the port number set in
# the 'www' entry below, but with an externally-visible host name which the
# buildbot cannot figure out without some help.

c['buildbotURL'] = "http://localhost:8010/"

# minimalistic config to activate new web UI
c['www'] = dict(port=8010,
                plugins=dict(waterfall_view={}, console_view={}, grid_view={}))

####### DB URL

c['db'] = {
    'db_url' : "sqlite:///state.sqlite",
}
