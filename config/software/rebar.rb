#
# Copyright:: Copyright (c) 2012-2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "rebar"
# Current version (2.3.0) suffers from a pretty bad bug that breaks tests.
# (see https://github.com/rebar/rebar/pull/279 and https://github.com/rebar/rebar/pull/251)
default_version "93621d0d0c98035f79790ffd24beac94581b0758"

dependency "erlang"

source :git => "https://github.com/rebar/rebar.git"

relative_path "rebar"

env = {
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}",
  "LD_FLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "./bootstrap", :env => env
  command "cp ./rebar #{install_dir}/embedded/bin/"
end
