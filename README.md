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
around. Note that only the 2.3.0 identifiers that were generated in the first step shall be bumped.

> I have two ideas: (a) fail the build if before step 1 there is any release version identifier 2.3.0 in the deps (because it will be corrupted in step 6); (b) generate a unix patch in step 1 and then [reverse a patch](https://stackoverflow.com/questions/3902388/permanently-reversing-a-patch-file) and replace the debug version identifier before applying the reversed patch.

For the build order in the step 3, there are two options again:

1. Create a dependency graph in the build script here. Pros: easier to maintain, more understandable. Cons: unclear path for error recovery. E.g. what if the script fails while copying the javadoc for the core library and we want to restart it from there and continue deploying client etc.?
2. Create a single script that builds and deploys the projects from a single repo but create a Jenkins build per repository and make complex build trigger rules over there. Pros: less coding, ability to trigger more than one build in parallel, can continue deployment when some build step fails by triggering the rest of the build configurations manually. Cons: need to keep both the script mechanics and the Jenkins build dependencies in mind, also harder to debug, less future-proof if we migrate to Travis build system in the future.

---

The project consists of the following parts that have to be released:

- core
- client
- server
- store
- tools
- (future work) validation

There are also a few old repos that have not been released lately.

## License

The project is licensed under EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
