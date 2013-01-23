#!/usr/bin/env ruby

require 'octokit'

class GitHubSourceFinder
  def initialize()
    @repos = Octokit.search_repositories('android')
    @repos.each do |repo|
      puts Octokit.branches(repo)
    end
  end
end

if __FILE__ == $0
  GitHubSourceFinder.new
end
