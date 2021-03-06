#--
# =============================================================================
# Copyright (c) 2004, Jamis Buck (jamis@37signals.com)
# All rights reserved.
#
# This source file is distributed as part of the Net::SFTP Secure FTP Client
# library for Ruby. This file (and the library as a whole) may be used only as
# allowed by either the BSD license, or the Ruby license (or, by association
# with the Ruby license, the GPL). See the "doc" subdirectory of the Net::SFTP
# distribution for the texts of these licenses.
# -----------------------------------------------------------------------------
# net-sftp website: http://net-ssh.rubyforge.org/sftp
# project website : http://rubyforge.org/projects/net-ssh
# =============================================================================
#++

$:.unshift "../lib"
require 'uri/open-sftp'

uri = URI.parse( "sftp://localhost" +
                 "/home/jgb3/temp/out" +
                 "?encryption=blowfish-cbc&compression=zlib" )

data = uri.open.read
p data.length

stream = uri.open( :chunk_size=>128,
                   :progress_proc => proc { |d| print "."; $stdout.flush } )
puts
p stream.read.length
