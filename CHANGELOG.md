# [4.0.0](https://github.com/rgxcp/wikalpa/compare/v3.0.0...v4.0.0) (2022-01-03)


### Features

* move path for following user ([bdcd459](https://github.com/rgxcp/wikalpa/commit/bdcd459ead51fe0ff19e4f12af645d79031fea01))


### BREAKING CHANGES

* Path for following user from `POST /users/:id/follow`
was moved to `POST /users/:id/buddies`. The reason behind this changes
was to follow the REST-way.

Signed-off-by: Rommy Gustiawan <rgcppp@gmail.com>

# [3.0.0](https://github.com/rgxcp/wikalpa/compare/v2.6.0...v3.0.0) (2022-01-03)


### Features

* move path for joining community ([dc1fe18](https://github.com/rgxcp/wikalpa/commit/dc1fe18a7c12cd8024177f88ce7cd53c4cf045a0))


### Reverts

* change .new back to .build ([0c1a33d](https://github.com/rgxcp/wikalpa/commit/0c1a33dc977e4f526acbb8a1d815ccd66186d36c))


### BREAKING CHANGES

* Path for joining community from `POST
/communities/:id/join` was moved to `POST /communities/:id/members`.
The reason behind this changes was to follow the REST-way.

Signed-off-by: Rommy Gustiawan <rgcppp@gmail.com>

# [2.6.0](https://github.com/rgxcp/wikalpa/compare/v2.5.0...v2.6.0) (2022-01-01)


### Features

* DELETE /users/:id/unfollow returns 200 status code when user a buddy ([5dd8fa0](https://github.com/rgxcp/wikalpa/commit/5dd8fa0a6e5978aed3ab0ce8764ca5a00a6392a7))
* DELETE /users/:id/unfollow returns 401 status code when user not logged in ([eae60d7](https://github.com/rgxcp/wikalpa/commit/eae60d7b0f93e80b69ff0b0e4e25b0f40354fd2b))
* DELETE /users/:id/unfollow returns 404 status code when user not a buddy ([27b8e0d](https://github.com/rgxcp/wikalpa/commit/27b8e0d89a843cd070fac139ccd33f607a7875c3))
* DELETE /users/:id/unfollow returns 404 status code when user not exists ([caf889c](https://github.com/rgxcp/wikalpa/commit/caf889cbc32b6d01118eece3b73bf1dd6e0d97f5))


### Performance Improvements

* put repetitive finding user into before action method ([3788024](https://github.com/rgxcp/wikalpa/commit/3788024c7faefa426f3421b1261a3b4499897317))

# [2.5.0](https://github.com/rgxcp/wikalpa/compare/v2.4.0...v2.5.0) (2022-01-01)


### Features

* add has many 'Buddy' association on 'User' ([d425c2e](https://github.com/rgxcp/wikalpa/commit/d425c2e53096290af90d71d182e6f5f07f50e992))
* POST /users/:id/follow returns 201 status code when entity valid ([45d6a87](https://github.com/rgxcp/wikalpa/commit/45d6a87114ce3c952789f5ef700b8d03ef9f368a))
* POST /users/:id/follow returns 401 status code when user not logged in ([82dc14f](https://github.com/rgxcp/wikalpa/commit/82dc14f9039588b15464a83309cbcc8e4ce73e63))
* POST /users/:id/follow returns 404 status code when user not exists ([39ee13b](https://github.com/rgxcp/wikalpa/commit/39ee13bd0aa10a70f2c461d2c8d47421e4ba8235))
* POST /users/:id/follow returns 422 status code when entity invalid ([ea53576](https://github.com/rgxcp/wikalpa/commit/ea53576efbb562f27448c8f5bfdc806237027cfb))

# [2.4.0](https://github.com/rgxcp/wikalpa/compare/v2.3.0...v2.4.0) (2022-01-01)


### Features

* PATCH /replies/:id returns 200 status code when entity valid ([46f5cfa](https://github.com/rgxcp/wikalpa/commit/46f5cfa94c51ab414cb055e6c8ebba9b3c4705dc))
* PATCH /replies/:id returns 401 status code when user not logged in ([c480d7a](https://github.com/rgxcp/wikalpa/commit/c480d7ac564aa1c74981ccd7f3f9bce191ac6ee6))
* PATCH /replies/:id returns 403 status code when editing someone else reply ([af4a4fe](https://github.com/rgxcp/wikalpa/commit/af4a4fe28a173c2e0e9194745cc8c9b91dc95935))
* PATCH /replies/:id returns 404 status code when reply not exists ([b4220b9](https://github.com/rgxcp/wikalpa/commit/b4220b98428d4665eba0d0c7367a9c884d3ccf45))
* PATCH /replies/:id returns 422 status code when entity invalid ([710f590](https://github.com/rgxcp/wikalpa/commit/710f590b942297727ef3ab89954dc140fe04cb21))

# [2.3.0](https://github.com/rgxcp/wikalpa/compare/v2.2.0...v2.3.0) (2022-01-01)


### Features

* add has many 'Reply' association on 'Comment' ([ede7023](https://github.com/rgxcp/wikalpa/commit/ede7023bc9238d92254ac5c62e8e9913e2ad0f44))
* POST /comments/:id/replies returns 201 status code when entity valid ([ccbe29f](https://github.com/rgxcp/wikalpa/commit/ccbe29fd858c3700dd67bdb737f5a894cabd1d41))
* POST /comments/:id/replies returns 401 status code when user not logged in ([7f08ef4](https://github.com/rgxcp/wikalpa/commit/7f08ef48d3bdb9e69f9c73bac474eab18a9dc32b))
* POST /comments/:id/replies returns 404 status code when comment not exists ([7b42503](https://github.com/rgxcp/wikalpa/commit/7b425033c3c71dca762e8bcb07b1feead65ce907))
* POST /comments/:id/replies returns 422 status code when entity invalid ([c10aaa8](https://github.com/rgxcp/wikalpa/commit/c10aaa82fc15495af50f76a156ab78f8d9708e2a))

# [2.2.0](https://github.com/rgxcp/wikalpa/compare/v2.1.0...v2.2.0) (2021-12-31)


### Features

* PATCH /comments/:id returns 200 status code when entity valid ([a2927f5](https://github.com/rgxcp/wikalpa/commit/a2927f5528ce5147d2289e2b73cea8cf07643a2f))
* PATCH /comments/:id returns 401 status code when user not logged in ([4e183cd](https://github.com/rgxcp/wikalpa/commit/4e183cda557cd91d0dbf2502c850c5734a4703d1))
* PATCH /comments/:id returns 403 status code when editing someone else comment ([45f21f4](https://github.com/rgxcp/wikalpa/commit/45f21f40091c339d59e5c48a5bba36cd0cbe87d0))
* PATCH /comments/:id returns 404 status code when comment not exists ([5445dbe](https://github.com/rgxcp/wikalpa/commit/5445dbec470e94f8bac5605f325f28c3f1c6dea4))
* PATCH /comments/:id returns 422 status code when entity invalid ([88e8852](https://github.com/rgxcp/wikalpa/commit/88e88525fb7582ae25f6055b9b60cf802bbebfdf))

# [2.1.0](https://github.com/rgxcp/wikalpa/compare/v2.0.0...v2.1.0) (2021-12-31)


### Features

* add has many 'Comment' association on 'Post' ([9a3fe1e](https://github.com/rgxcp/wikalpa/commit/9a3fe1eac0833507893ae16240f4930abf922130))
* POST /posts/:id/comments returns 201 status code when entity valid ([45f0541](https://github.com/rgxcp/wikalpa/commit/45f05417d34bfda7011fe7a28d102203eb31d110))
* POST /posts/:id/comments returns 401 status code when user not logged in ([1df33e9](https://github.com/rgxcp/wikalpa/commit/1df33e9006d0591ff7dfd930d92e8ae8772a6b4e))
* POST /posts/:id/comments returns 404 status code when post not exists ([28275ab](https://github.com/rgxcp/wikalpa/commit/28275ab7a76e8b00e9682e6bd4a15f97245f5814))
* POST /posts/:id/comments returns 422 status code when entity invalid ([c0b28cb](https://github.com/rgxcp/wikalpa/commit/c0b28cb0e3f9c95a79cd4d00a1434a9355f2a522))

# [2.0.0](https://github.com/rgxcp/wikalpa/compare/v1.11.0...v2.0.0) (2021-12-31)


### Performance Improvements

* change path for edit post to PATCH /posts/:id ([9ca81c4](https://github.com/rgxcp/wikalpa/commit/9ca81c473e15cdfd8475374e28177df0c2cb68bc))


### BREAKING CHANGES

* This changes is to prevent cumbersome logic for
editing a post

Signed-off-by: Rommy Gustiawan <rgcppp@gmail.com>

# [1.11.0](https://github.com/rgxcp/wikalpa/compare/v1.10.0...v1.11.0) (2021-12-30)


### Features

* PATCH /communities/:id/posts/:id returns 200 status code when entity valid ([f24b275](https://github.com/rgxcp/wikalpa/commit/f24b275c964bb6a67675a9557420ae5963e09f54))
* PATCH /communities/:id/posts/:id returns 403 status code when editing someone else post ([c8fe52e](https://github.com/rgxcp/wikalpa/commit/c8fe52e2f59f6415138c4e627bf791997a4ab5fc))
* PATCH /communities/:id/posts/:id returns 422 status code when entity invalid ([abc31cf](https://github.com/rgxcp/wikalpa/commit/abc31cf4fe7cb418fdf9a4d8e1cc871718cff475))

# [1.10.0](https://github.com/rgxcp/wikalpa/compare/v1.9.0...v1.10.0) (2021-12-30)


### Features

* PATCH /communities/:id/posts/:id returns 401 status code when user not logged in ([55db4cb](https://github.com/rgxcp/wikalpa/commit/55db4cb7c5cfb10f1f41288000462f205d78a8c8))
* PATCH /communities/:id/posts/:id returns 403 status code when user not a community member ([7a53456](https://github.com/rgxcp/wikalpa/commit/7a53456f37dbc4edd26c63a5510b9b71a14ea6d5))
* PATCH /communities/:id/posts/:id returns 404 status code when community not exists ([ad9d4ef](https://github.com/rgxcp/wikalpa/commit/ad9d4ef509968b4210fea4ba6e6ac2a7d2cf8c3e))
* PATCH /communities/:id/posts/:id returns 404 status code when post not exists ([79683d0](https://github.com/rgxcp/wikalpa/commit/79683d0f664924365ef622a5a075d83b6a0df94e))
* PATCH /communities/:id/posts/:id returns false success body when user not a community member ([1595048](https://github.com/rgxcp/wikalpa/commit/1595048962c14b7816134fa1235b2efdd6475f6b))
* PATCH /communities/:id/posts/:id returns forbidden message body when user not a community member ([6e9b435](https://github.com/rgxcp/wikalpa/commit/6e9b435ffedff5aa36a3d8ec9269ea123fe38caa))

# [1.9.0](https://github.com/rgxcp/wikalpa/compare/v1.8.0...v1.9.0) (2021-12-29)


### Features

* add has many 'Post' association on 'Community' ([a911f15](https://github.com/rgxcp/wikalpa/commit/a911f15ffa20240096a6f421da76744e21273664))
* POST /communities/:id/posts returns 201 status code when entity valid ([1b42578](https://github.com/rgxcp/wikalpa/commit/1b425781bf59ebc897c87808fa786937aec31891))
* POST /communities/:id/posts returns 401 status code when user not logged in ([e8c610b](https://github.com/rgxcp/wikalpa/commit/e8c610b6e283fdef463554838e875bf1a8c135fb))
* POST /communities/:id/posts returns 403 status code when user not a community member ([5627334](https://github.com/rgxcp/wikalpa/commit/5627334a054785207fcccd6895331c8ca72a1f3f))
* POST /communities/:id/posts returns 404 status code when community not exists ([f027da8](https://github.com/rgxcp/wikalpa/commit/f027da8016698ae63ab9385c02c486def715583f))
* POST /communities/:id/posts returns 422 status code when entity invalid ([e6bad93](https://github.com/rgxcp/wikalpa/commit/e6bad938f9b0cd0c8ea21888b782311045b1da99))
* POST /communities/:id/posts returns created message body when entity valid ([338762b](https://github.com/rgxcp/wikalpa/commit/338762bd4a91e9c5330ea58e6f89828e76cf9993))
* POST /communities/:id/posts returns false success body when entity invalid ([dbd51e9](https://github.com/rgxcp/wikalpa/commit/dbd51e9df52cfdab9729871fc9c3dd5e08e8a900))
* POST /communities/:id/posts returns false success body when user not a community member ([8e11a73](https://github.com/rgxcp/wikalpa/commit/8e11a738fe7bad26a3e583ff68724e7065b2997a))
* POST /communities/:id/posts returns forbidden message body when user not a community member ([aa114ea](https://github.com/rgxcp/wikalpa/commit/aa114ea4fb52815c62b337451a7520cf476d2b58))
* POST /communities/:id/posts returns post data when entity valid ([4c2ecfd](https://github.com/rgxcp/wikalpa/commit/4c2ecfddd940aadb7ac6d11adfaf93b243cc47b5))
* POST /communities/:id/posts returns true success body when entity valid ([f977d61](https://github.com/rgxcp/wikalpa/commit/f977d61453f89aec07e4121562c6a4c6d5bc2d95))
* POST /communities/:id/posts returns unprocessable entity message body when entity invalid ([64b080a](https://github.com/rgxcp/wikalpa/commit/64b080a466f2921eed179beb85204828ca290e58))
* POST /communities/:id/posts returns validation errors when entity invalid ([60ef550](https://github.com/rgxcp/wikalpa/commit/60ef5506c663d4a22787ec113e41de2ae31f297f))


### Performance Improvements

* put repetitive finding community into before action method ([5a3d925](https://github.com/rgxcp/wikalpa/commit/5a3d9256102b9776f21fe140d1b459d9d1da84e5))

# [1.8.0](https://github.com/rgxcp/wikalpa/compare/v1.7.0...v1.8.0) (2021-12-28)


### Features

* DELETE /communities/:id/leave returns 200 status code when auth user a community member ([94a08d2](https://github.com/rgxcp/wikalpa/commit/94a08d275198311e6cbfa7648481bb8877dab4d6))
* DELETE /communities/:id/leave returns 401 status code when user not logged in ([3192609](https://github.com/rgxcp/wikalpa/commit/31926091ae04c4052813402eeb1d8df9e60d9080))
* DELETE /communities/:id/leave returns 404 status code when auth user not a community member ([7cc540d](https://github.com/rgxcp/wikalpa/commit/7cc540d06556bbf658e3db2ac6cedffa174a49cd))
* DELETE /communities/:id/leave returns 404 status code when community not exists ([a5b5414](https://github.com/rgxcp/wikalpa/commit/a5b5414439f8b06565a86bb9196469eaa677426f))
* DELETE /communities/:id/leave returns member data when auth user a community member ([3bdee94](https://github.com/rgxcp/wikalpa/commit/3bdee94f756c25723aafc2933b4143f679dcff64))
* DELETE /communities/:id/leave returns ok message body when auth user a community member ([54d4cfe](https://github.com/rgxcp/wikalpa/commit/54d4cfede9f05617922515f1f1315ed177388f88))
* DELETE /communities/:id/leave returns true success body when auth user a community member ([d174871](https://github.com/rgxcp/wikalpa/commit/d17487101b535bfab745b74660104ca91744d8f1))

# [1.7.0](https://github.com/rgxcp/wikalpa/compare/v1.6.0...v1.7.0) (2021-12-28)


### Features

* add has many 'Member' association on 'Community' ([c6401b8](https://github.com/rgxcp/wikalpa/commit/c6401b80ec63e8e55f8bd921d4acf80d0513626d))
* POST /communities/:id/members returns 201 status code when entity valid ([b117df7](https://github.com/rgxcp/wikalpa/commit/b117df7981c14594269639c13c15f236111580b0))
* POST /communities/:id/members returns 401 status code when user not logged in ([b2aa45a](https://github.com/rgxcp/wikalpa/commit/b2aa45a1b2e9dc8d067ca925209300213e06cd94))
* POST /communities/:id/members returns 404 status code when community not exists ([fe4bcde](https://github.com/rgxcp/wikalpa/commit/fe4bcde266761b5ff9f5568750c44b236d6a5706))
* POST /communities/:id/members returns 422 status code when entity invalid ([b9cfa4e](https://github.com/rgxcp/wikalpa/commit/b9cfa4e6a2a65d0df3be3c7c478bd57bedf4774a))
* POST /communities/:id/members returns created message body when entity valid ([9818d44](https://github.com/rgxcp/wikalpa/commit/9818d446d4fcd8f02a95dfaa2855288a24cca082))
* POST /communities/:id/members returns false success body when entity invalid ([8739f79](https://github.com/rgxcp/wikalpa/commit/8739f791859d02b7aef862884646146c943f81b3))
* POST /communities/:id/members returns member data when entity valid ([18633ad](https://github.com/rgxcp/wikalpa/commit/18633ad3ae1375f6837c0ef0f50a892e4e438fb5))
* POST /communities/:id/members returns true success body when entity valid ([86d7384](https://github.com/rgxcp/wikalpa/commit/86d7384ebfdb353781135ee27265297e3e70c2cb))
* POST /communities/:id/members returns unprocessable entity message body when entity invalid ([89a9ab4](https://github.com/rgxcp/wikalpa/commit/89a9ab442e18ecfe144c3be3b59fb87fa8b625f0))
* POST /communities/:id/members returns validation errors when entity invalid ([36996e9](https://github.com/rgxcp/wikalpa/commit/36996e950e772ed8ca519e6874be1f9e872c3ce9))

# [1.6.0](https://github.com/rgxcp/wikalpa/compare/v1.5.0...v1.6.0) (2021-12-28)


### Features

* load user on authenticate request method ([299013f](https://github.com/rgxcp/wikalpa/commit/299013fcfbd1366fce430654d061f85da732a369))
* PATCH /communities/:id returns 200 status code when entity valid ([b89e78a](https://github.com/rgxcp/wikalpa/commit/b89e78a9886118060dd7a4bb6b7c8ab54710dca6))
* PATCH /communities/:id returns 401 status code when user not logged in ([646edc9](https://github.com/rgxcp/wikalpa/commit/646edc9895dbd2f4421e9f0b4c7b16c9a906bc5a))
* PATCH /communities/:id returns 403 status code when auth user not a community member ([3cb0b94](https://github.com/rgxcp/wikalpa/commit/3cb0b9450b081bf90912eee335f197eb349bf23e))
* PATCH /communities/:id returns 404 status code when community not exists ([5fdd5e6](https://github.com/rgxcp/wikalpa/commit/5fdd5e6bf2db6efd15459b27ca0fbcb9de0663f2))
* PATCH /communities/:id returns 422 status code when entity invalid ([344b5ee](https://github.com/rgxcp/wikalpa/commit/344b5ee4e1bcb3199ce56041e007c7ae0e8d8b10))
* PATCH /communities/:id returns community data when entity valid ([46ef3b7](https://github.com/rgxcp/wikalpa/commit/46ef3b70e89bd59edf54e011af86b004f807888c))
* PATCH /communities/:id returns false success body when auth user not a community member ([b6ccb82](https://github.com/rgxcp/wikalpa/commit/b6ccb824caf8818c1b0d3dddd5649bd3411ccad3))
* PATCH /communities/:id returns false success body when entity invalid ([4e7067c](https://github.com/rgxcp/wikalpa/commit/4e7067c69a1b33bf671ec03b6f93839a7e20f5fb))
* PATCH /communities/:id returns forbidden message body when auth user not a community member ([6ee9480](https://github.com/rgxcp/wikalpa/commit/6ee94805d59d6141651effefd72ea1b1601a1781))
* PATCH /communities/:id returns ok message body when entity valid ([a3c64a9](https://github.com/rgxcp/wikalpa/commit/a3c64a9a4fbadcc2eb16a3a9b4073dc9881ae307))
* PATCH /communities/:id returns true success body when entity valid ([d5978dc](https://github.com/rgxcp/wikalpa/commit/d5978dc7f1a94b72f1849453433d49cff385d6b4))
* PATCH /communities/:id returns unprocessable entity message body when entity invalid ([dedba03](https://github.com/rgxcp/wikalpa/commit/dedba033ad6bf9961725fbd39cb8a7753401d740))
* PATCH /communities/:id returns validation errors when entity invalid ([de9d123](https://github.com/rgxcp/wikalpa/commit/de9d1233ba375360afebf31e3bcda32e6451e0b0))

# [1.5.0](https://github.com/rgxcp/wikalpa/compare/v1.4.0...v1.5.0) (2021-12-28)


### Features

* POST /communities adds auth user into community member when entity valid ([9d80aa4](https://github.com/rgxcp/wikalpa/commit/9d80aa4350d3935a3509e1e6386391e46ff9176b))
* POST /communities returns 201 status code when entity valid ([9a5b025](https://github.com/rgxcp/wikalpa/commit/9a5b025ead29b4cea20043b8e6d1ee98f9dd1d3b))
* POST /communities returns 401 status code when user not logged in ([8aea38e](https://github.com/rgxcp/wikalpa/commit/8aea38e9b8af2bd9d730dcc86cfc647f79f46bfd))
* POST /communities returns 422 status code when entity invalid ([cda7b4d](https://github.com/rgxcp/wikalpa/commit/cda7b4de2b842920012968ed8e31f03ec8561757))
* POST /communities returns community data when entity valid ([047ce1d](https://github.com/rgxcp/wikalpa/commit/047ce1d3e39660c84eb51d13a77825ccd0f1931b))
* POST /communities returns created message body when entity valid ([779b87b](https://github.com/rgxcp/wikalpa/commit/779b87bbc917e9e93cc731a2e99a16185d615cc1))
* POST /communities returns false success body when entity invalid ([d7faac0](https://github.com/rgxcp/wikalpa/commit/d7faac08e7cce142a1f32d741487f92d33320913))
* POST /communities returns true success body when entity valid ([264dde2](https://github.com/rgxcp/wikalpa/commit/264dde20b79ce24a315f4f2b0028c85b21539ef5))
* POST /communities returns unprocessable entity message body when entity invalid ([cc64624](https://github.com/rgxcp/wikalpa/commit/cc64624e9a31d8ce2dc1f6674cb93a804f63de51))
* POST /communities returns validation errors when entity invalid ([4b17db8](https://github.com/rgxcp/wikalpa/commit/4b17db8371524d00c46004dbd279d32f0954d0f7))

# [1.4.0](https://github.com/rgxcp/wikalpa/compare/v1.3.0...v1.4.0) (2021-12-28)


### Features

* add forbidden response method ([247f850](https://github.com/rgxcp/wikalpa/commit/247f850c60d0446ff1423500870cc49c8d3d287c))
* PATCH /users/:id excludes password digest on user data ([8d4aee1](https://github.com/rgxcp/wikalpa/commit/8d4aee1da4818dd5a6c4b32f1655c1bfe3e01ddd))
* PATCH /users/:id returns 200 status code when entity valid ([56abca9](https://github.com/rgxcp/wikalpa/commit/56abca9f5e518612990c274c54ee1a3806d69348))
* PATCH /users/:id returns 401 status code when user not logged in ([69f5db2](https://github.com/rgxcp/wikalpa/commit/69f5db2be3077f1d0db6666d2ee02b076d8fa639))
* PATCH /users/:id returns 403 status code when editing someone else account ([6706c3c](https://github.com/rgxcp/wikalpa/commit/6706c3cea87d9796a42ef6649021bc49543edc55))
* PATCH /users/:id returns 404 status code when user not exists ([458c455](https://github.com/rgxcp/wikalpa/commit/458c455c15ac528cb527e052a425323f987c882c))
* PATCH /users/:id returns 422 status code when entity invalid ([3e7b1ca](https://github.com/rgxcp/wikalpa/commit/3e7b1ca38f702f49dc6679c62db282561727e402))
* PATCH /users/:id returns false success body when entity invalid ([2443346](https://github.com/rgxcp/wikalpa/commit/244334669236de5e7aa39e5c9b0ae01bcf440482))
* PATCH /users/:id returns falsey success body when editing someone else account ([d4ab33b](https://github.com/rgxcp/wikalpa/commit/d4ab33b47b3c8ee306394e7feef3caf4454707f0))
* PATCH /users/:id returns falsey success body when user not logged in ([3151d54](https://github.com/rgxcp/wikalpa/commit/3151d54813fb1a85368ce13cbee7fc8ceee7d234))
* PATCH /users/:id returns forbidden message body when editing someone else account ([a0ac74a](https://github.com/rgxcp/wikalpa/commit/a0ac74a26075f9174c62b6a28c647b3b0bb23c42))
* PATCH /users/:id returns ok message body when entity valid ([d55b093](https://github.com/rgxcp/wikalpa/commit/d55b0932400cead55dd2bd3b2ef30ce51e5ff45c))
* PATCH /users/:id returns true success body when entity valid ([c6b858b](https://github.com/rgxcp/wikalpa/commit/c6b858b009c9b426f584c66cb54f592211911941))
* PATCH /users/:id returns unauthorized message body when user not logged in ([1ca7718](https://github.com/rgxcp/wikalpa/commit/1ca7718317f49f3f119d34dd8646d013514f4d07))
* PATCH /users/:id returns unprocessable entity message body when entity invalid ([a870816](https://github.com/rgxcp/wikalpa/commit/a87081640c39753c79bf34ec677ef154c8956a11))
* PATCH /users/:id returns user data when entity valid ([241045a](https://github.com/rgxcp/wikalpa/commit/241045aa412ca9c1efa68378e2768d6e34ea5f36))
* PATCH /users/:id returns validation errors when entity invalid ([54bbcb4](https://github.com/rgxcp/wikalpa/commit/54bbcb41bb54e203f0f13005fd9e860c7af37648))

# [1.3.0](https://github.com/rgxcp/wikalpa/compare/v1.2.0...v1.3.0) (2021-12-28)


### Features

* add created response method ([5a38f1a](https://github.com/rgxcp/wikalpa/commit/5a38f1a72d6ca903be787d150d32272b44601a44))
* add ok response method ([641d376](https://github.com/rgxcp/wikalpa/commit/641d376c58bd3f8c2a9cee2b4015a21ece77c4b7))
* add unauthorized response method ([8bf22fa](https://github.com/rgxcp/wikalpa/commit/8bf22fa7291fd100aceff128a8f2677d43e94ace))
* add unprocessable entity response method ([9f68be4](https://github.com/rgxcp/wikalpa/commit/9f68be443c3fea42dc0ad548023eb8cff57b8c23))

# [1.2.0](https://github.com/rgxcp/wikalpa/compare/v1.1.0...v1.2.0) (2021-12-26)


### Bug Fixes

* wrong JSON key (status to success) ([e94eedf](https://github.com/rgxcp/wikalpa/commit/e94eedfe9c938070448ccdda051f6b417008df45))
* wrong method for finding user (find to find_by!) ([04c5200](https://github.com/rgxcp/wikalpa/commit/04c5200be9c9d97b046a9262aeb06f48a006eeac))


### Features

* POST /auth/login excludes password digest on user data ([6ba9e65](https://github.com/rgxcp/wikalpa/commit/6ba9e65f7649cf52e9d011a54474549e9f92b7f0))
* POST /auth/login generates token data when password valid ([18b58ff](https://github.com/rgxcp/wikalpa/commit/18b58ff7ef6952143fc6eed7ae8b2f642fbd1e84))
* POST /auth/login returns 200 status code when password valid ([f91742f](https://github.com/rgxcp/wikalpa/commit/f91742f1a529733be7260e71744c0b145a51383a))
* POST /auth/login returns 401 status code when password not valid ([3a003ab](https://github.com/rgxcp/wikalpa/commit/3a003ab8db793dddb5128a5468beab8e0b712494))
* POST /auth/login returns 404 status code when username not exists ([79efcc8](https://github.com/rgxcp/wikalpa/commit/79efcc8c14f6f1e61538c82fd0f6dd1ebe77fbf0))
* POST /auth/login returns falsey status body when password not valid ([4477927](https://github.com/rgxcp/wikalpa/commit/44779275b36a71429373fbe3077cc8064cab9f4a))
* POST /auth/login returns falsey status body when username not exists ([dda2da0](https://github.com/rgxcp/wikalpa/commit/dda2da01882cbbc47d94dea636643ba6abadd84b))
* POST /auth/login returns not found message body when username not exists ([6456b04](https://github.com/rgxcp/wikalpa/commit/6456b04991cb4966259447bca6ba03725f22e6e3))
* POST /auth/login returns ok message body when password valid ([f8fd734](https://github.com/rgxcp/wikalpa/commit/f8fd7340466a7fdf56b4c82ac3d3c4240bae14fa))
* POST /auth/login returns truthy success body when password valid ([9a38923](https://github.com/rgxcp/wikalpa/commit/9a389233e8b03c0c013cc209ca39ded865e92d0f))
* POST /auth/login returns unauthorized message body when password not valid ([be2b82c](https://github.com/rgxcp/wikalpa/commit/be2b82cdbfbe6b238ba5ab55ab7eb573805d6ef2))
* POST /auth/login returns user data when password valid ([0522b69](https://github.com/rgxcp/wikalpa/commit/0522b69bafcccb87841bb99fd90faa909b380ad6))

# [1.1.0](https://github.com/rgxcp/wikalpa/compare/v1.0.0...v1.1.0) (2021-12-26)


### Features

* POST /auth/register excludes password digest on user data ([5adb8ca](https://github.com/rgxcp/wikalpa/commit/5adb8ca34af591e528a457f4fc162a1e9e9f5876))
* POST /auth/register generates token data when entity valid ([3f88470](https://github.com/rgxcp/wikalpa/commit/3f8847022a08eb67da7be9f68f61f464e712bec8))
* POST /auth/register returns 201 status code when entity valid ([8dfc5cb](https://github.com/rgxcp/wikalpa/commit/8dfc5cb4c6e785f012c33a19f7ef3e3a38fc9481))
* POST /auth/register returns 422 status code when entity invalid ([27bc706](https://github.com/rgxcp/wikalpa/commit/27bc70613ba594ac60bd82f47c12785f4b3c5361))
* POST /auth/register returns created message body when entity valid ([8c897a6](https://github.com/rgxcp/wikalpa/commit/8c897a68598eba30b2fe4c6a832993d3aca1208e))
* POST /auth/register returns falsey status body when entity invalid ([2777b9f](https://github.com/rgxcp/wikalpa/commit/2777b9fc1aa1dd588ce49fdb4faa2be87826d0ad))
* POST /auth/register returns truthy status body when entity valid ([af09429](https://github.com/rgxcp/wikalpa/commit/af094293d89805a2e3d15b57dc4f2a1eb9501de0))
* POST /auth/register returns unprocessable entity message body when entity invalid ([50d42f4](https://github.com/rgxcp/wikalpa/commit/50d42f49e7471037fb3eff1130d9ee5ca097cab0))
* POST /auth/register returns user data when entity valid ([502275f](https://github.com/rgxcp/wikalpa/commit/502275fb8a7fa572991e009dfc9f01ad9025609c))
* POST /auth/register returns validation errors when entity invalid ([9e6a307](https://github.com/rgxcp/wikalpa/commit/9e6a307848f6dfc7b5b8e29b86a2e57620e451de))

# 1.0.0 (2021-12-23)


### Features

* add belongs to 'Buddy' association on 'Buddy' ([ef11a75](https://github.com/rgxcp/wikalpa/commit/ef11a752a253d6c9700cc112aaebb362eaaf4558))
* add belongs to 'Comment' association at 'Reply' ([d023496](https://github.com/rgxcp/wikalpa/commit/d02349624251e5cd1290fb9d34bd79d01111480d))
* add belongs to 'Community' association at 'Member' ([76307a1](https://github.com/rgxcp/wikalpa/commit/76307a177662e78469e5a41f3b6607b9cbbe732f))
* add belongs to 'Community' association at 'Post' ([3fdd70f](https://github.com/rgxcp/wikalpa/commit/3fdd70fd46fb91b9120db141b5db00b3c313bbce))
* add belongs to 'Post' association at 'Comment' ([b2655a6](https://github.com/rgxcp/wikalpa/commit/b2655a66ea78d4c70d7ead292e488760cfb06343))
* add belongs to 'User' association at 'Comment' ([58f24a5](https://github.com/rgxcp/wikalpa/commit/58f24a5f7f4cc1a00b75bfbc3cd227ccb3bfa4e7))
* add belongs to 'User' association at 'Like' ([a454997](https://github.com/rgxcp/wikalpa/commit/a454997479e81ce9a3394e314d4fbed0218f8bf1))
* add belongs to 'User' association at 'Member' ([d930a36](https://github.com/rgxcp/wikalpa/commit/d930a3692b6ed982ebc62f40c6cabcb7b9dff45d))
* add belongs to 'User' association at 'Post' ([f5e75f1](https://github.com/rgxcp/wikalpa/commit/f5e75f1d1000412f16bbb48ed1bdb3b512cbd3b7))
* add belongs to 'User' association at 'Reply' ([0454452](https://github.com/rgxcp/wikalpa/commit/04544527cf98ee855b45277be7aebdf30fd8e8ba))
* add belongs to 'User' association on 'Buddy' ([fd0c32a](https://github.com/rgxcp/wikalpa/commit/fd0c32ac71bbfa8f94e44371d95ef08d7ef795bf))
* add polymorphic belongs to 'Likeable' association at 'Like' ([d06ed25](https://github.com/rgxcp/wikalpa/commit/d06ed251bc04f523a47c20d170c5fec1d8226f8d))
* allow 'User' to have secure password ([5f5b6a7](https://github.com/rgxcp/wikalpa/commit/5f5b6a77b38b44e6f7700e6bc85a27a94c0bb60c))
* allow length of 'User' username to be at most 20 ([0825136](https://github.com/rgxcp/wikalpa/commit/08251360724a6ec48efc55cdd1fb44dce099dafa))
* convert 'User' username into lowercase before validation ([61b40f4](https://github.com/rgxcp/wikalpa/commit/61b40f4930fad62bc2b402e20aa985043eaf73e0))
* remove 'Comment' body trailing spaces before validation ([69f5f3a](https://github.com/rgxcp/wikalpa/commit/69f5f3a182e721a4cfed08779a71b8d7b6575434))
* remove 'Community' description trailing spaces before validation ([707f44c](https://github.com/rgxcp/wikalpa/commit/707f44cd1c4e0ff71dbbf55713156b89da4a8293))
* remove 'Community' name trailing spaces before validation ([0b7c50e](https://github.com/rgxcp/wikalpa/commit/0b7c50e3d8ccb5f9e10b7974b1eb02e74ea5ffac))
* remove 'Post' body trailing spaces before validation ([64d6905](https://github.com/rgxcp/wikalpa/commit/64d69050e14f3f61c0918b3babfa2b2163cc9e61))
* remove 'Reply' body trailing spaces before validation ([9e31a52](https://github.com/rgxcp/wikalpa/commit/9e31a527fa3a374d5224a6dc2d605363863c0bec))
* remove 'User' username trailing spaces before validation ([d3a9eec](https://github.com/rgxcp/wikalpa/commit/d3a9eec6ba45dd0e4c5536f64775ee401ed3f615))
* validate 'Community' name can't contain spaces & non word chars ([6e95a73](https://github.com/rgxcp/wikalpa/commit/6e95a7359000ac206f6181a8b3a16326419bafc2))
* validate 'User' password can't be equal to username ([ebdaa0a](https://github.com/rgxcp/wikalpa/commit/ebdaa0a27cf3274a66f0212e59f1df27d424b927))
* validate 'User' username can't contain spaces & non word chars ([7710662](https://github.com/rgxcp/wikalpa/commit/7710662be7bb0796858f5537c102e505b65724d4))
* validate adding self as buddy ([68c2fee](https://github.com/rgxcp/wikalpa/commit/68c2fee63c54d8178399b8d4b95f4c2081bfba04))
* validate length of 'Comment' body is at most 255 ([ac37e2c](https://github.com/rgxcp/wikalpa/commit/ac37e2c7722c56b0c5575d4e2c9a238f6b74bd50))
* validate length of 'Community' description is at most 255 ([95a96d2](https://github.com/rgxcp/wikalpa/commit/95a96d2ecb5c4ef9ecf7dd2cfa2bdb75c7c7869a))
* validate length of 'Community' name is at least 5 ([aca5c15](https://github.com/rgxcp/wikalpa/commit/aca5c156f35000244eed19ac3a116f170378c2ee))
* validate length of 'Community' name is at most 20 ([f3de372](https://github.com/rgxcp/wikalpa/commit/f3de372ae7f5697549aa68f4d0c7efe5cd3ddd6e))
* validate length of 'Post' body is at most 255 ([ed4842c](https://github.com/rgxcp/wikalpa/commit/ed4842c0d4c098afdbac1bf48a723413e036a4fb))
* validate length of 'Reply' body is at most 255 ([adfcfb3](https://github.com/rgxcp/wikalpa/commit/adfcfb37253c2dfc24495c0dd2abec536dae8162))
* validate length of 'User' password is at least 8 ([aae7e9c](https://github.com/rgxcp/wikalpa/commit/aae7e9cb6da5b183371a2cf690b673a544e46a1c))
* validate length of 'User' username is at least 5 ([6584e84](https://github.com/rgxcp/wikalpa/commit/6584e845aeccb974a402280c3199382bb2bd1b78))
* validate length of 'User' username is at most 15 ([0dea41b](https://github.com/rgxcp/wikalpa/commit/0dea41b00d8baaee18dc85c3dabbf2206207ecd9))
* validate length of 'User' username is at most 15 ([98c99e2](https://github.com/rgxcp/wikalpa/commit/98c99e279bce7ca8c229f2c6d12c0699289d5cdd))
* validate presence of 'Buddy' buddy ([db6f94a](https://github.com/rgxcp/wikalpa/commit/db6f94aaa58f55be07c02a54a88702629859c961))
* validate presence of 'Buddy' user ([6cceefe](https://github.com/rgxcp/wikalpa/commit/6cceefe5871993090b89f71e4964c39bfc6add12))
* validate presence of 'Comment' body ([849c63d](https://github.com/rgxcp/wikalpa/commit/849c63d726469b0f9f1f96032bd2c87e009174a9))
* validate presence of 'Comment' post ([bf29f20](https://github.com/rgxcp/wikalpa/commit/bf29f2042a8672c9e188c1936aafa52d91a4f5a4))
* validate presence of 'Comment' user ([6c1f90c](https://github.com/rgxcp/wikalpa/commit/6c1f90caec85ae44439dbf9155ae069121dd5c17))
* validate presence of 'Community' description ([9a017fa](https://github.com/rgxcp/wikalpa/commit/9a017fa4ab3c5754b6237c528cbbb837134aaaaa))
* validate presence of 'Community' name ([8295115](https://github.com/rgxcp/wikalpa/commit/8295115b0b7b41c4f01f5a0f3c04cb946672eaf4))
* validate presence of 'Like' user ([4dd520f](https://github.com/rgxcp/wikalpa/commit/4dd520f5bb5b116686c23da94f90ebb528035ddb))
* validate presence of 'Member' community ([9227939](https://github.com/rgxcp/wikalpa/commit/9227939ab2fa3e23724ad7e5f53cc803f80fda3a))
* validate presence of 'Member' user ([3e6fd61](https://github.com/rgxcp/wikalpa/commit/3e6fd61da9d51339489fa1d04f4308c8926aed85))
* validate presence of 'Post' body ([e1d1c65](https://github.com/rgxcp/wikalpa/commit/e1d1c65e5a220c6c602eb773b22bd4beb086992d))
* validate presence of 'Post' community ([f70a2e0](https://github.com/rgxcp/wikalpa/commit/f70a2e092f7d84b9abdf23d3d1e83a5ff0856c61))
* validate presence of 'Post' user ([6aec52a](https://github.com/rgxcp/wikalpa/commit/6aec52a52f375b8a2a41a91a64489f65aa1bdeeb))
* validate presence of 'Reply' body ([39c2150](https://github.com/rgxcp/wikalpa/commit/39c215076293249754cd7c5b77dae105d25009e4))
* validate presence of 'Reply' comment ([0e81539](https://github.com/rgxcp/wikalpa/commit/0e8153973d44cc21d2f91add4ffc207e1a5e7492))
* validate presence of 'Reply' user ([d260a7b](https://github.com/rgxcp/wikalpa/commit/d260a7b4827b9232e6114719bdcab9ef3f954dad))
* validate presence of 'User' username ([aae3666](https://github.com/rgxcp/wikalpa/commit/aae366662abc2073256d89979173d1d6bd130810))
* validate uniqueness of 'Buddy' buddy scoped to user_id ([fa6b270](https://github.com/rgxcp/wikalpa/commit/fa6b2704707d86c369d2a58e9d5714d1af7650ff))
* validate uniqueness of 'Community' name ([10a51e2](https://github.com/rgxcp/wikalpa/commit/10a51e25f161d5a9c012cb7f04dd499f7d17e58f))
* validate uniqueness of 'Like' user scoped to likeable_type & likeable_id ([308e0b6](https://github.com/rgxcp/wikalpa/commit/308e0b63d8202222b97e1463346d03121f6c3a90))
* validate uniqueness of 'Member' user scoped to community_id ([5172ea6](https://github.com/rgxcp/wikalpa/commit/5172ea648aa3cebc0fe59c017adfa0727db40a10))
* validate uniqueness of 'User' username ([291bdd8](https://github.com/rgxcp/wikalpa/commit/291bdd8f6b629b54fc285c88d8dbd4fef8e1e6aa))


### Performance Improvements

* remove unused likeable polymorphic association on 'Like' ([ced2a72](https://github.com/rgxcp/wikalpa/commit/ced2a723dd60fbc2acf73a3a6d7dc9b9404e9e2c))


### Reverts

* add likeable polymorphic association on 'Like' back ([394fe73](https://github.com/rgxcp/wikalpa/commit/394fe73bd4f358cc1b81d4f58fce963b62ea42d1))
