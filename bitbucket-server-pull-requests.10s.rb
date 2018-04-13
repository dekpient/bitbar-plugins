#!/usr/bin/env -S -P /Users/workuser/.rbenv/shims:/Users/homeuser/.rbenv/shims ruby

# <bitbar.title>Bitbucket Server (Stash) Pull Requests Dashboard</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Nitkalya Wiriyanuparb</bitbar.author>
# <bitbar.author.github>dekpient</bitbar.author.github>
# <bitbar.desc>Displays a list of open pull requests from your personal dashboard. Requires Bitbucket Server 4.10 or newer.</bitbar.desc>
# <bitbar.image>http://via.placeholder.com/350x150?text=TODO</bitbar.image>
# <bitbar.dependencies>rest-client, chronic_duration</bitbar.dependencies>

# CONFIG
# Only runs on the work machine based on configured hostname

WORK_HOSTNAME='worklaptop'

require 'socket'

exit 0 unless Socket.gethostname.include? WORK_HOSTNAME

ICON = "iVBORw0KGgoAAAANSUhEUgAAAB4AAAAoCAYAAADpE0oSAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAABAtJREFUWAnll0tvTVEUxw+KIF7xqIQW0QoGxMxzJv0AvoC5D2Agks49QrwiBka+gYgIA8+BRuL9DkVbbyn1aLz9f+fs/+m+t+cetyLtwD/5n732Wuustdfa+967b5IMYJTEBnFsIDK6WsAPLBc3pVKSjA5j3cOYEs8im5PO0nsfxV3hfRZbF3Ak8I/g3aZxpfhLvCKeErHFPiT9Js4Tz4mTxHcioEPuEjH+iBZ5XBJxjtmheasIaKMrbZLcLdq3XXI1KMqLqLal85l69ogOwup7o/kLybNFo1mCk36SzHs7RBLNEaeJMYq2KrXv19NJCUCSRpF9s/6wZLBQdNIvkm3/LPm1+FZ8KdK9LeJkEbCoQbgnDQFODLJkOmy3xKXiI5F5nPRn0HkR8UgnN4hgUOV9UuK8DaswIRB5q4jtoXg9yFQXB0fmAHLg4PfAeHEbpQMVld+VgpfLKr4p+xKx3opZADG/hpGuLBNBXvkeTVzBTsl8NtnneI8Pag7K9pj9fSM6GV0grit3YflJny7j4+CE44dAL6ZL8xmi0SzBn4L4VI+TnkPJR+2IyPu0nWoda4VkkFfNl8E10Q4e2VcSAT7H3qM4Ob7tOFThvObYSO4ubA4+DQQbL3aLR4MSJwjQPRXxYeUE4UsE3SqxUwTYADZ8welsyG1M2cIUJGYvwMRsSCtDD6yzDzoODgnYApLTbn9pUKF9HUOqHNhTYPRm58pgY3AlkSoVnfyVZqtFtgkU+Ts+9lz2nqEcKkjOIbkRSFASV1daVNAgJ703JNBWd60wQa1o1aur5Vemp8qypHl74yD/InEcr255OBIXdmM4Ehd2YTgSj9gej1ir/7+Kax4u70FRS/7m8Dle0bt5Doz+Ue4PS4u/ibhfAftks/Knff0uC/FirLNPskjG28HBjox3xFYR5M7ZtPBpnwWyck+LYyHzg9IspuCO9Uy0U/XVh3syVxpQ1L7MMmDjmtQl1or3RDauW8mByKnWZe8QjoIrymaVT9v2Sk1Stmy7OFvk3wqyF7NbcnI/KE4wqQI6nB+IvtLkByTytY6bia/LxyK7xeMSiHeH1s0J2othjC/054OOvyJTglw0ODE+U4PDhTByfYLAOeaSuCdVJcnaMPZrhGB9NiTvNcJaoArQF4i8jofASfZpXpNqsjOV0G/3vtafNvYNeB+zWeXTNp8Zbifsa6PIAUb2R3Wf5PSG2KnRyfmbCj3nFHJSQT2nmsP0XPT7xOqN5nSYw5aiSc8zop09npVuvghcUTYrftpnscyXRcfx2CFdC69yKHCmLYB9WSnieFX0AYl9pC5F7NsmT+IB4p1MpagIrzToK4YyW4VjNCl7J7X5Y+B3UHofOQjuhO1DGd1N56CLxGNMfgOP70is4ur+2gAAAABJRU5ErkJggg==".freeze
USER = 'username'.freeze
PASS = File.read('/Users/username/.thatpassword').chomp.freeze
HOST = 'stash'.freeze
APPROVAL_MIN_COUNT = 2.freeze
PR_TITLE_MAX_LENGTH = 50.freeze

# END CONFIG

require 'chronic_duration'
require 'json'
require 'rest-client'
require 'pp'

# Monkey Patching
class String
  def truncate(max)
    length > max ? "#{self[0...max]}…" : self
  end
end

# Client
class BitbucketServer
  def initialize(options = {})
    @host = options.delete(:host) || 'localhost'
    @port = options.delete(:port) || 443
    @user = options.delete(:user)
    @pass = options.delete(:pass)
    @baseurl = "https://#{@host}:#{@port}/rest/api"
    @rest = RestClient::Resource.new @baseurl, @user, @pass
  end

  def dashboard_prs(role, participant_status = nil)
    url = "1.0/dashboard/pull-requests?state=OPEN&role=#{role}"
    url = "#{url}&participantStatus=#{participant_status}" if participant_status
    JSON.parse(@rest[url].get)['values']
  end
end

# Process and Output Data
class BitbucketServerPlugin
  # Participant statuses: UNAPPROVED, NEEDS_WORK, or APPROVED
  UNAPPROVED = 'UNAPPROVED'.freeze
  NEEDS_WORK = 'NEEDS_WORK'.freeze
  APPROVED = 'APPROVED'.freeze
  # REVIEWER, AUTHOR or PARTICIPANT
  REVIEWER = 'REVIEWER'.freeze
  AUTHOR = 'AUTHOR'.freeze

  def initialize(user, pass, host)
    @user = user
    @host = host
    @bitbucket = BitbucketServer.new(
      host: host,
      user: user,
      pass: pass
    )
  end

  def output
    opened_prs, reviewed_prs, approved_prs, my_prs = with_error_handling do
      [
        bitbucket.dashboard_prs(REVIEWER, UNAPPROVED),
        bitbucket.dashboard_prs(REVIEWER, NEEDS_WORK),
        bitbucket.dashboard_prs(REVIEWER, APPROVED),
        bitbucket.dashboard_prs(AUTHOR)
      ]
    end

    puts " #{opened_prs.empty? ? '' : opened_prs.size} | templateImage=#{ICON}"
    puts '---'
    puts "Open Dashboard | href=https://#{HOST}/dashboard"
    puts '---' unless opened_prs.empty?
    puts 'To Do' unless opened_prs.empty?
    opened_prs.each { |pr| puts output_line(pr, icon: '👥') } unless opened_prs.empty?
    puts '---' unless reviewed_prs.empty?
    puts 'Reviewed' unless reviewed_prs.empty?
    reviewed_prs.each { |pr| puts output_line(pr, color: 'color=orange', icon: '⛔') } unless reviewed_prs.empty?
    puts '---' unless approved_prs.empty?
    puts 'Approved' unless approved_prs.empty?
    approved_prs.each { |pr| puts output_line(pr, color: 'color=green', icon: '✅') } unless approved_prs.empty?
    puts '---' unless my_prs.empty?
    puts 'My PRs' unless my_prs.empty?
    my_prs.each { |pr| puts output_line(pr) } unless my_prs.empty?
    puts '---'
    puts 'Refresh | refresh=true'
  end

  private

  attr_reader :user, :host, :bitbucket

  def with_error_handling
    yield
  rescue SocketError => e
    puts "😡 PRs"
    puts '---'
    puts e
  rescue RestClient::RequestTimeout
    puts "😡 PRs"
    puts '---'
    puts "Connection to #{host} timed out"
  end

  # rubocop:disable Metrics/AbcSize
  def output_line(pr, color: nil, icon: nil)
    format('%s %s/%s - %s ⸨%s⸩ %s | href=%s %s',
           icon.nil? ? status_icon(pr) : icon,
           pr['toRef']['repository']['project']['key'],
           pr['toRef']['repository']['slug'],
           pr['title'].truncate(PR_TITLE_MAX_LENGTH),
           reviewer?(pr) ? duration(pr['updatedDate'] / 1000) : comment(pr),
           merge_status(pr),
           pr['links']['self'].first['href'],
           color.nil? ? color(pr) : color
          )
  end
  # rubocop:enable Metrics/AbcSize

  def color(pr)
    return 'color=green' if author?(pr) && pr['reviewers'].count { |reviewer| reviewer['approved'] } >= APPROVAL_MIN_COUNT
    return 'color=orange' if author?(pr) && pr['reviewers'].any? { |reviewer| reviewer['status'] == NEEDS_WORK }
    ''
  end

  def status_icon(pr)
    return '✅' if author?(pr) && pr['reviewers'].count { |reviewer| reviewer['approved'] } >= APPROVAL_MIN_COUNT
    return '⛔' if author?(pr) && pr['reviewers'].any? { |reviewer| reviewer['status'] == NEEDS_WORK }
    '⏱'
  end

  def merge_status(pr)
    pr['properties']['mergeResult']['outcome'] == 'CONFLICTED' ? '⚠️' : ''
  end

  def reviewer?(pr)
    !pr['reviewers'].select { |r| r['user']['slug'].eql?(user) }.empty?
  end

  def author?(pr)
    pr['author']['user']['slug'].eql?(user)
  end

  def duration(tstamp)
    return 'never' if tstamp == 0
    ChronicDuration.output (Time.now.to_f - tstamp).to_i, weeks: true, units: 2
  end

  def comment(pr)
    count = pr['properties']['commentCount']
    return '0 comment' unless count
    "#{count} comment#{count > 1 ? 's' : ''}"
  end

  def msg(text)
    puts text unless ENV['BitBar']
  end

  def debug(obj)
    pp obj unless ENV['BitBar']
  end
end

if ARGV.empty?
  ARGV << USER
  ARGV << PASS
  ARGV << HOST
end

plugin = BitbucketServerPlugin.new(*ARGV)
plugin.output
