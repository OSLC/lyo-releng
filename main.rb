#!/usr/bin/env ruby

# =============================================================================
# Copyright (c) 2017 Andrew Berezovskyi
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License 2.0 which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# This Source Code may also be made available under the following Secondary
# Licenses when the conditions for such availability set forth in the Eclipse
# Public License, v. 2.0 are satisfied: GNU General Public License, version 2
# with the GNU Classpath Exception which is
# available at https://www.gnu.org/software/classpath/license.html.
#
# SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
# =============================================================================

=begin
This is the script to assist with the release engineering for Eclipse Lyo
project. It is intended to be invoked manually by the developer within the
Jenkins environment.

The project deployment consists of the following major steps:

1. Update debug version identifiers to the release counparts
2. Commit the changed versions and tag that commit with the release version
   number.
3. Ensure the build still succeeds with the release identifiers.
4. (future work) Sign the JARs for distribution.
5. Deploy the JARs to Eclipse Maven, the plugins to the P2 site, the Javadoc to
   the Lyo website.
6. Increment the version identifier and replace the release identifier with the
   new debug version identifier in a new commit.

Example:

1. {2.3.0-SNAPSHOT, 2.3.0.qualifier} -> 2.3.0
2. Tag 'v2.3.0'
3. Ensure the core 2.3.0 gets built and deployed to Eclipse Maven before client
   2.3.0 is built, asit would rely on the core 2.3.0
4. N/A
5. Should happen at for each project in §3.
6. 2.3.0 -> {2.3.1-SNAPSHOT, 2.3.1.qualifier}

In the last step, this is a safe step as it's always possible to bump
2.3.1-SNAPSHOT to 2.4.0-SNAPSHOT without releasing 2.3.1, but not the other way
around.

                                      ***

The project consists of the following parts that have to be released:

- core
- client
- server
- store
- tools
- (future work) validation

There are also a few old repos that have not been released lately.

=end

def main
  puts "TBD"
end