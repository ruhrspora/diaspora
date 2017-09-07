# Copyright (c) 2011 nov matake
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# See https://github.com/nov/openid_connect_sample/blob/master/app/models/pairwise_pseudonymous_identifier.rb

module Api
  module OpenidConnect
    class PairwisePseudonymousIdentifier < ApplicationRecord
      self.table_name = "ppid"

      belongs_to :o_auth_application, optional: true
      belongs_to :user

      validates :identifier, presence: true, uniqueness: {scope: :user}
      validates :guid, presence: true, uniqueness: true

      before_validation :setup, on: :create

      private

      def setup
        self.guid = SecureRandom.hex(16)
      end
    end
  end
end
