# AutoLocale
# Copyright (C) 2011-2016 Florian Schwab
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


require 'auto_locale/version'

module AutoLocale
  def self.included(base)
    base.before_action :set_auto_locale
  end

  def set_auto_locale
    available_locales = I18n.available_locales.map(&:to_s)

    locales = request.accept_language.split(/\s*,\s*/).map do |l|
      l += ';q=1.0' unless l =~ /;q=\d+\.\d+$/
      l.split(';q=')
    end.sort do |a, b|
      b.last.to_f <=> a.last.to_f
    end.map do |l|
      l.first.downcase.gsub(/-[a-z]+$/i) { |c| c.upcase }
    end

    locales.each do |l|
      available_locales.each do |al|
        if l == al
          I18n.locale = al.to_sym
          return
        elsif l.split('-', 2).first == al.split('-', 2).first
          I18n.locale = al.to_sym
          return
        end
      end
    end
  rescue
    I18n.locale = I18n.default_locale
  end
end

ActionController::Base.send :include, AutoLocale
