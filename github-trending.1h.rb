#!/usr/bin/env -S -P /Users/workuser/.rbenv/shims:/Users/homeuser/.rbenv/shims ruby

# <bitbar.title>Github Trending</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Nitkalya Wiriyanuparb</bitbar.author>
# <bitbar.author.github>dekpient</bitbar.author.github>
# <bitbar.desc>Github Daily Trending For Selected Languages</bitbar.desc>
# <bitbar.image>http://via.placeholder.com/350x150?text=TODO</bitbar.image>
# <bitbar.dependencies>ruby, nokogiri</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/dekpient/bitbar-plugins</bitbar.abouturl>

# CONFIG
# Check and fix the shebang. It supports multiple machines with different users e.g. work and home that use rbenv

LANGUAGES = {
  ''           => 'All | templateImage=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',
  'ruby'       => 'Ruby | templateImage=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',
  'python'     => 'Python | templateImage=iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAA95JREFUWAmtlzloFVEUhpO4i2JcCC6NSkSslKRVjI2KhYLYqZWIhVthIQQiVgqCaGFjnYCIS6EgSkBSiERQFMGtEIlpVFxwi2vU/5t3/8nNZGZ4ec8f/rnLWe655547815jQ/VYKtX1YrvYKs4Rp4rgu/hOHBT7xR7xszhBHBZrRlOwPKL27zj4Rrqrgy1B1AQbrpU1i38UD4rnwvinWnYHfwf+Uks20P8qLhCBN1IZVfmcGPQ61eJwV2T3NMyxMLIsHQS2wL4qo+hZTWTTgj41AFrEWUmvoaExtNnG2VuUFWTHhZFFig7ysObaxFZxvsjuLVM3F39yZ6PJbAAec6527kpnVxtLbCNR2nWG8OU+fggsCc4LIoTsyqDIwEnxskiBOTCcoDtTvChyJakDL6LuKNgXk14DH8MEgJGLaJv628WFYR4ZBfUjjNWkwAb7GenM2A43Z7N4Snwtok8Bd4kDIkGk6FbPgdTbki18HBX3h37s863mkivqc6bAdojslBSR6mop1UKQQXwCWnx+E+eKx8QkJVPUHmAgTBIdVDJR54MAIMAvKXdRb1G/mclVImdOVf6vxV1oL+WTKxuDgMjEbLGdolgpAibLAkBOkN6RurlAh10OidfEPhHEBYcO4zYCWCaWwcWDQeykzOaVhOvE3SL+yQhrGd7Ecia5w8CTlVHl6WNBdlXkfcBnljGBZUEGuXqPxX0ixU3m4sU1TNGCAIU8sICPZJP6z8Wd4jyx6CiwaRY3iFQ6vsuy1kQApAtkd+Rz2ioZTp6hNA5k055n+oEAeDOB+Agc+W3N3xMHUBB4pToryUTBg4CL0o6JN/sIpQfMCBghIBDv/rr6pBOw+OSkV//Dx9LHbigY6IVj90MacF9BNTuvaJY/yS6+noj9dno62CDkPe4XCRkhG8Bpq4xGnujahn4Z0YPgTKUZOfuzmmCRmF0aHwpzGMayevpX5CtBXCh7NMO3vUPkjLhON0TXAAsa9DkyPjAnxE+iz1XdBGRuusjn2lnE5qHYI4JGArAzhL2BalJwDQHyLLDl68YvYHyRfvvjxwpFfEfMA/7QHQV2gSPoH6PH1UexliPolh3Al/3SpnAReoIidBG5WCwratHnKMAlca84yEDghwfAl/3SphgVTTqb3xmTrqDGJvAzIPKTDrDweTHv2JCnyGYgFUSdu6FPIbmYInG6CP8VFgfBktDeD23NjXdwQR7IgGuBt2KcVo4A2QuxN/RvqjXsx+Oq29iwU1b86XQgRS1nzO8927rV1FiUCoM6OiwGuNMd4hpxhcgnF7wXebXeEtn5FxFwxHnHlgh5/APr2TXpJKAYDgAAAABJRU5ErkJggg==',
  'javascript' => 'JavaScript | templateImage=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',
  'swift'      => 'Swift | templateImage=iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAAuBJREFUWAm1l1uITlEUx8c9GmmIKR4UXsjtgZGaeHBLlEYpD0p5EZLMA0nJg0TzRKI8KJ6IlHiYKKE0D5PEvEgyLil3ocn98vvrW1/Lts85+3zzWfWbvfbaa62zzv725UxDQ32liXRLy6QcWMY5wfcdPvNhZ4Lvf3MZSeZX0JHyhEEFTpMY11uVka84N8KuSnulTPCAwHka/ZWBLaU7HicV8gu2pQSYTyuKptDLbjpt3pCon8FPBfyA5IU5GOfj0AwmQ1C6YbUZEttV+KkA8RzGQZJMxasHpjjv2eh9sMbZitQRONjPoCLOFwX48S10XsAcZ9yD/h3WOluRegcHmwW1C4sC/PhFOh9hWcWon6cLVMT6iq2oOYeDL0A/ZbKMwfMpfAN74ET0t/ATNEtFchIHX4D0lqIgP76Ajt5YgftB23QFqADZ9kKeHGMwLOBoXkBsTL+9JbmAPgr2Odsp9KEQkyMYLdba19jC8yYWW7XpvugES3AffRZcdrYb6LFtdtb5WLza6VBKRuPdC5ZEW7IdHjub1ss88HKTjsX4dpN3StVn4qhd4ROF2+wL4z75m8DfYrU2ahLdC7YoLVmsPY3fXIiNyXYVapYNRGYl9vbPOX73an56JXBHTnJfRJb+rL8FKP5gP4rQ4q2KTrxapYPArLfMs9/yD9TlshlKHQ4uwQH0vIfFxk64+D/qJf52Q2s4kNgvuya2h3nHYngEqlbfcIshdUZ0S26ETxB725hNV30T/CUz6H0AC3iIrulVMToJvUygo2taC/EJWEyZ9jBx/8hyLLp+Y4m0r99DykEUiw9tmrHm8LP8AcYeaANNrRf1h4Eup3qI8r3MSqRjtBfCquvd78wqQPZGOAT6rK7Hg/UdoBnWhWX5MmcAn6q0oF0HCyrbXiPWb2990NgpqmKSZRGemjL/BnnF3MVX/xtkyToG+lL3uk+in2YJ6K0mg47y4aBVrfv/NuhrqQuKZOtv52B4+dBxxIcAAAAASUVORK5CYII=',
  'go'         => 'Go | templateImage=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',
  'rust'       => 'Rust | templateImage=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',
  'vue'        => 'Vue | templateImage=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',
  'shell'      => 'Shell | templateImage=iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAArdJREFUWAnFljlvFEEQhdcHlywkJJAPAaEjkPgFiAAh/gIpKZIj/wbbSASQgJw7dUQC4g7IEQGBLZAcGgQGEWBz2Mv7xvNa5dnW7No7Xpf0dqqruutVVXfPbKt1RDJU8o7oaf2wU2mLYBsSSActI7HKU2Inm8MU+DYhQLkizAoTwj8hJqNhY7KjSCeENeGB0HorUOkg8ZjqICSbvwJjwOZjY/+HhSa2gLh/hDFhbbQMipE2IJAeK7TdH8ZNHUB4kC2qQTBQlUl+SH8quGq60YS4cwWvW83BQv8p3C5Z7pY27LSJZz+gANavCIViUoz3MQZZkG6yfsk7iGkpbYbgo3BdiDKvQRPkHcQEhdyVf5V+Q4gyp4HJPc/jXp9ZYpPb+VlENyOz9Fi5O0TCfRM7AK81dE73VSHKPQ2cpMm9rtvTRa34OsXABPM9/iB9PTjPSp8OY9/LYKpVSSxJzDJW8EozeH9bxqVgY/7vElTASa8ixonxU8Vak/aHyV7wRvqkYEF/KcQg3fTc3ncQQ+iJT6SfESxTUl4LEDFvS2DvN4TvFWADzMklloh5V1u8X19kIDByUVgSrgkEOym8E+4IXLnTAsFYCyD7JXAAbwkIBeXOUsos3s1FTb4kPBcIhs8n/Zn040KdPJTTFdMl66liZ+kgMTsqOlc6sLuqb9LfCxwof92kJoHosnChtEDKWoQCWLNaJcbJQn8GnalbFRNjbp3k5ibiuMcOAimETsCk+NEJ6PZhywkxnHzOX5Sdc9CJXFLMhTwmg61XoaBCCJAGpe0gj/3GaENc3ef9Bukl0WrMttuJw/eRQE6GJ1JdaPuud+8vc+N6r8UGB9+B4v/dCyk4B4llsuBrMyOcF6pVy9SIuChePJ+ER7FlTR20bpm69Qe+Gt0I6vzDrpjLbr1uQRM+KuYFdDTyH/EekDQx+2AgAAAAAElFTkSuQmCC',
}.freeze

BASE_URL = 'https://github.com/'.freeze
MAX_LENGTH = 70.freeze
MAX_REPO = 20.freeze

# END CONFIG

require 'open-uri'
require 'json'
require 'nokogiri'

puts '★'
puts '---'
puts 'Trending Today'
puts 'Refresh | refresh=true'
puts '---'

results = LANGUAGES.each_with_object({ threads: [] }) do |(language, title), outputs|
  outputs[:threads] << Thread.new do
    tries ||= 3
    url = "https://github.com/trending/#{language}?since=daily"
    doc = open(url) { |f| Nokogiri::HTML f }

    outputs[language] = ["#{title} href=#{url}"]
    doc.xpath('//ol[@class="repo-list"]/li')[0, MAX_REPO].each do |node|
      repo = node.xpath('./div/h3/a').attribute('href').value.delete_prefix('/')
      author, name = repo.split('/')
      description = node.xpath('./div[3]/p').text.strip
      total_star = node.xpath('./div[last()]/a[1]').text.strip
      lang = node.xpath('./div[last()]/span[1]/span[@itemprop="programmingLanguage"]').text.strip
      new_star = node.xpath('./div[last()]/span[last()]').text.strip
      outputs[language] << "--#{name} (by #{author}) | size=14 href=#{BASE_URL + repo}"
      outputs[language] << "--★#{total_star} (#{new_star}) ➠ #{description} | size=12 length=#{MAX_LENGTH}" if !language.empty? || lang.nil? || lang.empty?
      outputs[language] << "--★#{total_star} (#{new_star}) [#{lang}] ➠ #{description} | size=12 length=#{MAX_LENGTH}" if language.empty? && !lang.nil? && !lang.empty?
    end
  rescue Exception => e
    retry unless (tries -= 1).zero?
    outputs[language] << "Failed to get GitHub data: #{e.message}"
  end
end

results[:threads].each(&:join)
results.reject { |key, _| key == :threads }.sort.to_h.each_value { |outputs| outputs.each { |line| puts line } }
