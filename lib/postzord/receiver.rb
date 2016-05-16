#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.


class Postzord::Receiver
  include Diaspora::Logging

  require 'postzord/receiver/local_batch'

  def perform!
    self.receive!
  end
end
