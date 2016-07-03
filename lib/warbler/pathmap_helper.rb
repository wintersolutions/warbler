#--
# Copyright (c) 2010-2012 Engine Yard, Inc.
# Copyright (c) 2007-2009 Sun Microsystems, Inc.
# This source code is available under the MIT license.
# See the file LICENSE.txt for details.
#++

class String
  alias_method :protected_pathmap_replace, :pathmap_replace
  # public
  def pathmap_replace(patterns, &block)
    protected_pathmap_replace(patterns, &block)
  end
end

module Warbler
  module PathmapHelper
    def apply_pathmaps(config, file, pathmaps)
      file = file.to_s
      file = file[2..-1] if file =~ /^\.\//
      pathmaps = config.pathmaps.send(pathmaps)
      pathmaps.each do |p|
        file = file.pathmap(p)
      end if pathmaps
      file
    end
  end
end
