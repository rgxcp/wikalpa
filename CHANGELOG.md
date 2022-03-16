# [7.0.0](https://github.com/rgxcp/wikalpa/compare/v6.38.0...v7.0.0) (2022-03-16)


### Features

* rename "Like" resource to "Upvote" ([0f331e0](https://github.com/rgxcp/wikalpa/commit/0f331e0da8bac824dd875e998a6e82fea619fb59))


### BREAKING CHANGES

* In order to be more "Reddit-like", the "Like" resource
is now renamed to "Upvote".

Signed-off-by: Rommy Gustiawan <rgcppp@gmail.com>

# [6.38.0](https://github.com/rgxcp/wikalpa/compare/v6.37.0...v6.38.0) (2022-03-14)


### Features

* add has many 'Collection' association on 'User' ([1f4bc86](https://github.com/rgxcp/wikalpa/commit/1f4bc86312cc68a4f75eeff8e12a4aa28ee82e3b))
* GET /users/:id/collections returns not found response when collections not exist ([d0b26e4](https://github.com/rgxcp/wikalpa/commit/d0b26e4e339149bb5d0ff9a96d17d6e1a7208bef))
* GET /users/:id/collections returns not found response when user not exists ([60de8af](https://github.com/rgxcp/wikalpa/commit/60de8afe281494d66bef889f26a7d7a042b878b4))
* GET /users/:id/collections returns ok response when collections exist ([1d0f5bb](https://github.com/rgxcp/wikalpa/commit/1d0f5bb2498d9897e4768c0354ad12377d784e9a))

# [6.37.0](https://github.com/rgxcp/wikalpa/compare/v6.36.0...v6.37.0) (2022-03-14)


### Features

* add has many 'Collection' through 'CollectionItem' association on 'Reply' ([3351ec0](https://github.com/rgxcp/wikalpa/commit/3351ec0b93d3fe1c4737440531ea697602644d58))
* GET /replies/:id/collections returns not found response when collections not exist ([ac869fd](https://github.com/rgxcp/wikalpa/commit/ac869fdaade00f0a2e9840a89bd6a3ee3b767e5f))
* GET /replies/:id/collections returns not found response when reply not exists ([151b8b3](https://github.com/rgxcp/wikalpa/commit/151b8b3ca179853e7e197a34e802c5ccebf08573))
* GET /replies/:id/collections returns ok response when collections exist ([568db7f](https://github.com/rgxcp/wikalpa/commit/568db7fc72dea993332384690968fe676ed09e8f))

# [6.36.0](https://github.com/rgxcp/wikalpa/compare/v6.35.0...v6.36.0) (2022-03-13)


### Features

* add has many 'Collection' through 'CollectionItem' association on 'Post' ([cb1566f](https://github.com/rgxcp/wikalpa/commit/cb1566fee0bf6ce351fd205bdd064dff17b86fef))
* GET /posts/:id/collections returns not found response when collections not exist ([0293b0a](https://github.com/rgxcp/wikalpa/commit/0293b0a0e83f5af4b17702dd76882075b0ad1937))
* GET /posts/:id/collections returns not found response when post not exists ([88cf56c](https://github.com/rgxcp/wikalpa/commit/88cf56c38adc9015de98803969434ad0d6f8b4fa))
* GET /posts/:id/collections returns ok response when collections exist ([3989fb7](https://github.com/rgxcp/wikalpa/commit/3989fb75f7096187cfd78bacdc886a448abbcced))

# [6.35.0](https://github.com/rgxcp/wikalpa/compare/v6.34.0...v6.35.0) (2022-03-12)


### Features

* add has many 'Collection' through 'CollectionItem' association on 'Community' ([a112b38](https://github.com/rgxcp/wikalpa/commit/a112b384c3b5f1c736f77c5a29dfdc2cabd241c8))
* GET /communities/:id/collections returns not found response when collections not exist ([e6b7772](https://github.com/rgxcp/wikalpa/commit/e6b7772f58e8ac1d9aa6dca2c3ee27b7f5a04ca1))
* GET /communities/:id/collections returns not found response when community not exists ([03fe52a](https://github.com/rgxcp/wikalpa/commit/03fe52a88492c03664468944466509cfc828e587))
* GET /communities/:id/collections returns ok response when collections exist ([244ed78](https://github.com/rgxcp/wikalpa/commit/244ed7832985a50fa166e818c4e20b087eda81df))

# [6.34.0](https://github.com/rgxcp/wikalpa/compare/v6.33.0...v6.34.0) (2022-02-08)


### Features

* add has many 'Collection' through 'CollectionItem' association on 'Comment' ([df2e506](https://github.com/rgxcp/wikalpa/commit/df2e506001ddf0c83e4bcc40cfe9b73a83787db8))
* GET /comments/:id/collections returns not found response when collections not exist ([1e90a0b](https://github.com/rgxcp/wikalpa/commit/1e90a0be2e88538939ba3fb0dffc6d64933909d6))
* GET /comments/:id/collections returns not found response when comment not exists ([a3c970a](https://github.com/rgxcp/wikalpa/commit/a3c970a722d38d2d8c6bfd385ef384784b9c7c8d))
* GET /comments/:id/collections returns ok response when collections exist ([dc9814d](https://github.com/rgxcp/wikalpa/commit/dc9814de22957abfc4133992519b19f0471865a0))

# [6.33.0](https://github.com/rgxcp/wikalpa/compare/v6.32.0...v6.33.0) (2022-02-07)


### Features

* add polymorphic has many 'Visitor' association on 'Collection' ([9626edb](https://github.com/rgxcp/wikalpa/commit/9626edb9659f2f858e78a686d90a2cbdeb9f70ca))
* GET /collections/:id/likes retrieve all likes from a collection ([483a8c9](https://github.com/rgxcp/wikalpa/commit/483a8c965b50ecfc666c0179c902d306242c6d5d))
* GET /collections/:id/visitors returns not found response when collection not exists ([33b4b11](https://github.com/rgxcp/wikalpa/commit/33b4b1113ec2f4edcbf81bd3e6ae2cbc75a9f8f9))
* GET /collections/:id/visitors returns not found response when visitors not exist ([39456b5](https://github.com/rgxcp/wikalpa/commit/39456b554548baf3cacf450854773608ecaa103e))
* GET /collections/:id/visitors returns ok response when visitors exist ([1aab49d](https://github.com/rgxcp/wikalpa/commit/1aab49d01a89f291057c1621d627df4275cc6462))

# [6.32.0](https://github.com/rgxcp/wikalpa/compare/v6.31.0...v6.32.0) (2022-02-05)


### Features

* add polymorphic has many 'Like' association on 'Collection' ([7602249](https://github.com/rgxcp/wikalpa/commit/76022493b03e8a0bf5f1ec7fd122e87550804e2d))
* POST /collections/:id/likes returns created response when entity valid ([cf75d69](https://github.com/rgxcp/wikalpa/commit/cf75d696692faf3e7f98d8f582c5143cdb4a4bc2))
* POST /collections/:id/likes returns not found response when collection not exists ([0170994](https://github.com/rgxcp/wikalpa/commit/0170994fe4512ea4a4e5c7aa99f590f2a934f601))
* POST /collections/:id/likes returns unauthorized response when user not logged in ([44fa137](https://github.com/rgxcp/wikalpa/commit/44fa137f553ead3d41a48281022706eb0d70b33e))
* POST /collections/:id/likes returns unprocessable entity response when entity invalid ([e3045dc](https://github.com/rgxcp/wikalpa/commit/e3045dc4676c6eb0ca42ca5c9d7f79bb19637003))

# [6.31.0](https://github.com/rgxcp/wikalpa/compare/v6.30.0...v6.31.0) (2022-02-03)


### Features

* add polymorphic has many 'Bookmark' association on 'Collection' ([fe8f746](https://github.com/rgxcp/wikalpa/commit/fe8f746c037414a2134330583f524db43378cc4a))
* POST /collections/:id/bookmarks returns created response when entity valid ([19a78ca](https://github.com/rgxcp/wikalpa/commit/19a78cabed9f424e64d21fdac44f445c4063f7ff))
* POST /collections/:id/bookmarks returns not found response when collection not exists ([801b631](https://github.com/rgxcp/wikalpa/commit/801b6316852b92007f9ec9e53e294977b019ddb7))
* POST /collections/:id/bookmarks returns unauthorized response when user not logged in ([eb7a5e0](https://github.com/rgxcp/wikalpa/commit/eb7a5e0b976df3f2f4e711618f43c63585e859c9))
* POST /collections/:id/bookmarks returns unprocessable entity response when entity invalid ([3967a8a](https://github.com/rgxcp/wikalpa/commit/3967a8a735c2a1e7ce6fd3273e9ab7062aa35018))

# [6.30.0](https://github.com/rgxcp/wikalpa/compare/v6.29.0...v6.30.0) (2022-02-02)


### Features

* GET /collections/:id/collection-items returns not found response when collection not exists ([d1246fd](https://github.com/rgxcp/wikalpa/commit/d1246fdf7e0d6cf35da2c0caa50b606c9a1bb44d))
* GET /collections/:id/collection-items returns ok response when collection items exist ([9896ed2](https://github.com/rgxcp/wikalpa/commit/9896ed20ced5d513f88030b846f950c5c4ca5ba0))

# [6.29.0](https://github.com/rgxcp/wikalpa/compare/v6.28.0...v6.29.0) (2022-02-01)


### Features

* CollectionWorker#perform deletes collection when collection items count equal to zero ([a7aa2f8](https://github.com/rgxcp/wikalpa/commit/a7aa2f831ed37532df62eb50099bbc6d59e47ea2))
* DELETE /collections/:id/collection-items/:id enqueues collection worker job in background when collection item exists ([9fd3669](https://github.com/rgxcp/wikalpa/commit/9fd3669394d8021d48ae22ee06a1a96ac541772c))
* DELETE /collections/:id/collection-items/:id returns forbidden response when deleting collection item on someone else collection ([5ed4454](https://github.com/rgxcp/wikalpa/commit/5ed4454b5dcc4b6d5b0832e911459c44c88dedce))
* DELETE /collections/:id/collection-items/:id returns not found response when collection item not exists ([b374022](https://github.com/rgxcp/wikalpa/commit/b37402229c97c944ecb513439e9352054e5c7f0e))
* DELETE /collections/:id/collection-items/:id returns not found response when collection not exists ([3ac63e8](https://github.com/rgxcp/wikalpa/commit/3ac63e86393db3f2d930418069e467ffd5e5777c))
* DELETE /collections/:id/collection-items/:id returns ok response when collection item exists ([e0db81f](https://github.com/rgxcp/wikalpa/commit/e0db81fe6a1bc92261fff138342863a92940bf76))
* DELETE /collections/:id/collection-items/:id returns unauthorized response when user not logged in ([32dbfe8](https://github.com/rgxcp/wikalpa/commit/32dbfe845db188844c679c1c703b028485444e41))

# [6.28.0](https://github.com/rgxcp/wikalpa/compare/v6.27.0...v6.28.0) (2022-01-31)


### Features

* GET /collections/:id enqueues visitor worker job in background when visiting collection while user logged in ([cccad3e](https://github.com/rgxcp/wikalpa/commit/cccad3e2de56953c21cba2e44e7ef9c7a323aeb2))
* POST /collections/:id/collection-items returns created response when entity valid ([4e5aa65](https://github.com/rgxcp/wikalpa/commit/4e5aa65be2605e4b6e3efe49c619f25fa2904a57))
* POST /collections/:id/collection-items returns forbidden response when adding collection item on someone else collection ([911d6b9](https://github.com/rgxcp/wikalpa/commit/911d6b96e0bbb2c6b6a8b5bfb3ec29c1a208528c))
* POST /collections/:id/collection-items returns not found response when collection not exists ([131d543](https://github.com/rgxcp/wikalpa/commit/131d54316741959cd891fcc5dfed26a07ba95efc))
* POST /collections/:id/collection-items returns unauthorized response when user not logged in ([a0cfc30](https://github.com/rgxcp/wikalpa/commit/a0cfc30e7b1fdee2bd686bdef58c2487a1d63dcf))
* POST /collections/:id/collection-items returns unprocessable entity response when entity invalid ([8eb75a8](https://github.com/rgxcp/wikalpa/commit/8eb75a86c2e148ec0944eba4fb81ddf8eb4b0d38))
* restrict VisitorWorker from retrying when job failed ([6da898d](https://github.com/rgxcp/wikalpa/commit/6da898d5d6bf88156eadf3e10c8593cc78d2210a))
* validate inclusion of bookmarkable type on 'Bookmark' ([2799b8f](https://github.com/rgxcp/wikalpa/commit/2799b8fb97f017374f07ebf8e16196f2248b1b72))
* validate inclusion of collectable type on 'CollectionItem' ([105dfe5](https://github.com/rgxcp/wikalpa/commit/105dfe596d962a20b2c744d6877b115290cbedbb))
* validate inclusion of likeable type on 'Like' ([1b7a2cd](https://github.com/rgxcp/wikalpa/commit/1b7a2cd32e350c0a2d4655c469e60d8e88124de6))
* validate inclusion of visitable type on 'Visitor' ([6d6d478](https://github.com/rgxcp/wikalpa/commit/6d6d478760cce2e9045d279f178a767650e271ee))

# [6.27.0](https://github.com/rgxcp/wikalpa/compare/v6.26.0...v6.27.0) (2022-01-30)


### Features

* GET /collections/:id returns not found response when collection not exists ([c28b7d9](https://github.com/rgxcp/wikalpa/commit/c28b7d9c8d831457f1c165fc71305a4c44915fe5))
* GET /collections/:id returns ok response when collection exists ([f658538](https://github.com/rgxcp/wikalpa/commit/f658538a4ee35591608d71c3d5a54846da8bf09d))

# [6.26.0](https://github.com/rgxcp/wikalpa/compare/v6.25.0...v6.26.0) (2022-01-29)


### Features

* GET /collections returns not found response when collections not exist ([c71ddb5](https://github.com/rgxcp/wikalpa/commit/c71ddb5f544071490e3e297f61ba2fd4b783304d))
* GET /collections returns ok response when collections exist ([193fcd1](https://github.com/rgxcp/wikalpa/commit/193fcd1115cecb17ca6b4a06affdf174a8d525ea))

# [6.25.0](https://github.com/rgxcp/wikalpa/compare/v6.24.0...v6.25.0) (2022-01-27)


### Features

* PATCH /collections/:id returns forbidden response when editing someone else collection ([ec5fb87](https://github.com/rgxcp/wikalpa/commit/ec5fb87b2f1b7009d6a0fd575ac033c0c17a7329))
* PATCH /collections/:id returns not found response when collection not exists ([fa5fb45](https://github.com/rgxcp/wikalpa/commit/fa5fb45a1310baffef4cdfba632efc3b86754f3f))
* PATCH /collections/:id returns ok response when entity valid ([c5d7b16](https://github.com/rgxcp/wikalpa/commit/c5d7b1680461289d8f31bf1d00a67bf7e83e72d3))
* PATCH /collections/:id returns unauthorized response when user not logged in ([687388d](https://github.com/rgxcp/wikalpa/commit/687388dae7e55013cc060e614b351aa75cd88ea2))
* PATCH /collections/:id returns unprocessable entity response when entity invalid ([014752e](https://github.com/rgxcp/wikalpa/commit/014752e49e096411d9e19e931179482add68e22e))

# [6.24.0](https://github.com/rgxcp/wikalpa/compare/v6.23.0...v6.24.0) (2022-01-27)


### Features

* POST /collections returns created response when valid ([df27fe9](https://github.com/rgxcp/wikalpa/commit/df27fe92184b70a161cd3ffbdad07bddf49666a4))
* POST /collections returns unauthorized response when user not logged in ([e583b1a](https://github.com/rgxcp/wikalpa/commit/e583b1a077a170f5ba6515b5d98f3cf18efb97ee))
* POST /collections returns unprocessable entity response when entity invalid ([038d1be](https://github.com/rgxcp/wikalpa/commit/038d1be6a6e4fce88e6e77c9817bb90b52698555))

# [6.23.0](https://github.com/rgxcp/wikalpa/compare/v6.22.0...v6.23.0) (2022-01-26)


### Features

* accept nested attributes for collection items on 'Collection' ([dca795a](https://github.com/rgxcp/wikalpa/commit/dca795ad519c6a20ad984eea521e77e14afbae15))
* add belongs to 'Collection' association on 'CollectionItem' ([87fe06a](https://github.com/rgxcp/wikalpa/commit/87fe06a36858836231daa2f448dd20c2406683a2))
* add belongs to 'User' association on 'Collection' ([9938004](https://github.com/rgxcp/wikalpa/commit/993800455e47976123f6ee7fb2c330855c0b083c))
* add has many 'CollectionItem' association on 'Collection' ([d1eb67f](https://github.com/rgxcp/wikalpa/commit/d1eb67f3b39243b72c1dd1074e01a8d0093dd27d))
* add polymorphic belongs to collectable association on 'Collection' ([a5f0d0c](https://github.com/rgxcp/wikalpa/commit/a5f0d0c39e03e46225465e74991f054814009b86))
* remove name trailing spaces before validation on 'Collection' ([0168a67](https://github.com/rgxcp/wikalpa/commit/0168a672363ee68287228420f0389fd81dc8ad47))
* validate length of name is at least 5 on 'Collection' ([2045e0b](https://github.com/rgxcp/wikalpa/commit/2045e0b1752e0a0aac147e732c0a23ffd6580c33))
* validate length of name is at most 50 on 'Collection' ([3efbd13](https://github.com/rgxcp/wikalpa/commit/3efbd13bf702d1ae70614c30a0d11321e4ef81fe))
* validate presence of collection items on 'Collection' create context ([c1c0c02](https://github.com/rgxcp/wikalpa/commit/c1c0c02ccab5b3d98422d50ebafdfed16ed387ba))
* validate presence of collection on 'CollectionItem' ([17950cf](https://github.com/rgxcp/wikalpa/commit/17950cfd6fc31318a5e089f9d5baa284e7a73e73))
* validate presence of name on 'Collection' ([d144014](https://github.com/rgxcp/wikalpa/commit/d1440143c7b27e906936ca325dd9834315f2d316))
* validate presence of user on 'Collection' ([30decbd](https://github.com/rgxcp/wikalpa/commit/30decbd011f0566490c0676038e0d14621606ae7))
* validate uniqueness of collectable_id scoped to collection_id on 'CollectionItem' ([fc4b937](https://github.com/rgxcp/wikalpa/commit/fc4b9376eeca66a21fa68613b1d0692ed0cd1e33))
* validate uniqueness of name scoped to user_id on 'Collection' ([a87625a](https://github.com/rgxcp/wikalpa/commit/a87625ab234827b2d34f122c93b25f8f35ef5e21))

# [6.22.0](https://github.com/rgxcp/wikalpa/compare/v6.21.0...v6.22.0) (2022-01-26)


### Features

* GET /users/:id/visitors returns forbidden response when viewing someone else visitors ([07e825d](https://github.com/rgxcp/wikalpa/commit/07e825db892757bceaadfcd388e58a58eb9abcac))
* GET /users/:id/visitors returns unauthorized response when user not logged in ([74be778](https://github.com/rgxcp/wikalpa/commit/74be7781bf408590ee4e57fc0ed0c9224c56ad4b))

# [6.21.0](https://github.com/rgxcp/wikalpa/compare/v6.20.0...v6.21.0) (2022-01-23)


### Features

* add belongs to 'User' association on 'Bookmark' ([1afd086](https://github.com/rgxcp/wikalpa/commit/1afd086cf30a9be72b8107f52b49622cb6ab3e9d))
* add has many 'Bookmark' association on 'User' ([364e742](https://github.com/rgxcp/wikalpa/commit/364e7428dac49626dca951ae53abe802057a035c))
* add has many 'Bookmark' polymorphic association on 'Comment' ([fe147c1](https://github.com/rgxcp/wikalpa/commit/fe147c139303c219635e27456c0ad00be93c67d7))
* add has many 'Bookmark' polymorphic association on 'Post' ([3238dcf](https://github.com/rgxcp/wikalpa/commit/3238dcf80dfd52d8502709e6c44858d5c13f8c3d))
* add has many 'Bookmark' polymorphic association on 'Reply' ([2faa123](https://github.com/rgxcp/wikalpa/commit/2faa1236bc9ff97c13ea8af95e1d941f4d994206))
* add polymorphic belongs bookmarkable association on 'Bookmark' ([f25b5b6](https://github.com/rgxcp/wikalpa/commit/f25b5b689ad606da02570cad6c0ae2dc26d3a4b7))
* DELETE /bookmarks/:id returns forbidden response when deleting someone else bookmark ([7f476de](https://github.com/rgxcp/wikalpa/commit/7f476de3dfe7d7ed0f59a1734818fb5aeff132f8))
* DELETE /bookmarks/:id returns not found response when bookmark not exists ([759caf8](https://github.com/rgxcp/wikalpa/commit/759caf80692b9eae2640c1ad8a90edba4367c939))
* DELETE /bookmarks/:id returns ok response when bookmark exists ([2d129d6](https://github.com/rgxcp/wikalpa/commit/2d129d677dcdc47756b2ed59fb2354352985bc3f))
* DELETE /bookmarks/:id returns unauthorized response when user not logged in ([9ba3510](https://github.com/rgxcp/wikalpa/commit/9ba35100b7c34206967591239609e4ff44689662))
* GET /users/:id/bookmarks returns forbidden response when viewing someone else bookmarks ([5ff86df](https://github.com/rgxcp/wikalpa/commit/5ff86df1c494310f3942827e473349d5713a1ae7))
* GET /users/:id/bookmarks returns not found response when bookmarks not exist ([4ab3c51](https://github.com/rgxcp/wikalpa/commit/4ab3c51b65a8ac0cbb7dc48eb12790e699ceda9c))
* GET /users/:id/bookmarks returns ok response when bookmarks exist ([eff441a](https://github.com/rgxcp/wikalpa/commit/eff441aece6218454eadc41ef9b969f164298369))
* GET /users/:id/bookmarks returns unauthorized response when user not logged in ([883f2e4](https://github.com/rgxcp/wikalpa/commit/883f2e4f0137c11dcc659532c9f83c18267db6cb))
* POST /comments/:id/bookmarks returns created response when valid ([7af7a0c](https://github.com/rgxcp/wikalpa/commit/7af7a0c0c2cbccc1e0229b7feec56378010587b1))
* POST /comments/:id/bookmarks returns not found response when comment not exists ([d15a66c](https://github.com/rgxcp/wikalpa/commit/d15a66c0408a4ae7a46951fd6b007eec35fa02e4))
* POST /comments/:id/bookmarks returns unauthorized response when user not logged in ([c7200c3](https://github.com/rgxcp/wikalpa/commit/c7200c3d3dff2bf6c2e71d08e10d5b152c5d4c72))
* POST /comments/:id/bookmarks returns unprocessable entity response when entity invalid ([1e17767](https://github.com/rgxcp/wikalpa/commit/1e17767c156ac5c0d613c7822c1c02761d65ee56))
* POST /posts/:id/bookmarks returns created response when entity valid ([576b650](https://github.com/rgxcp/wikalpa/commit/576b6506dc717a37921d2b5c5bdbc3809cdc0dda))
* POST /posts/:id/bookmarks returns not found response when post not exists ([3b46c1b](https://github.com/rgxcp/wikalpa/commit/3b46c1bedcf36df4bab51169663c80262853a02d))
* POST /posts/:id/bookmarks returns unauthorized response when user not logged in ([54f57f3](https://github.com/rgxcp/wikalpa/commit/54f57f3c45e20ebc9fe22dea661e3efa2bfee5eb))
* POST /posts/:id/bookmarks returns unprocessable entity response when entity invalid ([aef42e5](https://github.com/rgxcp/wikalpa/commit/aef42e5439908ae2a37c349f53853ba3aca6ef37))
* POST /replies/:id/bookmarks returns created response when entity valid ([b258632](https://github.com/rgxcp/wikalpa/commit/b2586328a5554e4d830e3cdb9aaad3c933518978))
* POST /replies/:id/bookmarks returns not found response when reply not exists ([3ff82ee](https://github.com/rgxcp/wikalpa/commit/3ff82ee6e8bbba6e3042a46d1eaa8abfb4c2b268))
* POST /replies/:id/bookmarks returns unauthorized response when user not logged in ([baaafee](https://github.com/rgxcp/wikalpa/commit/baaafeed5571bb1edba87603973bfcf5f3f7788d))
* POST /replies/:id/bookmarks returns unprocessable entity response when entity invalid ([e51edc9](https://github.com/rgxcp/wikalpa/commit/e51edc96df78ed1be14b5b99d9c67c5b37b0fcba))
* validate presence of 'User' on 'Bookmark' ([fbe8fcf](https://github.com/rgxcp/wikalpa/commit/fbe8fcf8dc3e136923f9d9be69c3caf066d4bf77))
* validate uniqueness of 'Bookmark' user scoped to bookmarkable_type & bookmarkable_id ([52db432](https://github.com/rgxcp/wikalpa/commit/52db43295edd32e72c3756e05cc679764c9c6fd0))

# [6.20.0](https://github.com/rgxcp/wikalpa/compare/v6.19.0...v6.20.0) (2022-01-22)


### Features

* add has many 'Like' association on 'User' ([96602d4](https://github.com/rgxcp/wikalpa/commit/96602d4bb80599d952f71175a7909f0dbd9babc5))
* GET /users/:id/likes returns not found response when likes not exist ([5e13e4f](https://github.com/rgxcp/wikalpa/commit/5e13e4fdda3165eab8a2b3cc1e1ca3d340e977ae))
* GET /users/:id/likes returns not found response when user not exists ([7631425](https://github.com/rgxcp/wikalpa/commit/7631425ce4cdc3e8ac790e5b3e6db5e43953afc8))
* GET /users/:id/likes returns ok response when likes exist ([30e96d1](https://github.com/rgxcp/wikalpa/commit/30e96d11a42cb9f9fef49c0e6213728a7851d0ab))

# [6.19.0](https://github.com/rgxcp/wikalpa/compare/v6.18.0...v6.19.0) (2022-01-17)


### Features

* GET /communities/:id/visitors returns not found response when community not exists ([03488b5](https://github.com/rgxcp/wikalpa/commit/03488b548c9f69bf489926ccc6908d6209117c26))
* GET /communities/:id/visitors returns not found response when visitors not exist ([ad1fc84](https://github.com/rgxcp/wikalpa/commit/ad1fc84e96e1e838386b2df6a2d86e72c71d4916))
* GET /communities/:id/visitors returns ok response when visitors exist ([bd14173](https://github.com/rgxcp/wikalpa/commit/bd141738ebf6fb44174e3bc97f0b2d3fddee547f))
* GET /posts/:id/visitors returns not found response when post not exists ([d7b7e06](https://github.com/rgxcp/wikalpa/commit/d7b7e0690039adbb95842749085314f3700f1cd9))
* GET /posts/:id/visitors returns not found response when visitors not exist ([4c9ef3c](https://github.com/rgxcp/wikalpa/commit/4c9ef3c1ec2871a46d60d380c682afcc6c2b7098))
* GET /posts/:id/visitors returns ok response when visitors exist ([a33ffce](https://github.com/rgxcp/wikalpa/commit/a33ffceb587a3c62c7bb9b3649b097723c858a85))
* GET /users/:id/visitors returns not found response when user not exists ([47b041b](https://github.com/rgxcp/wikalpa/commit/47b041b06931c6f963c085af40941208644070c6))
* GET /users/:id/visitors returns not found response when visitors not exist ([75ff815](https://github.com/rgxcp/wikalpa/commit/75ff8155667529457d150aa43ede6588362063df))
* GET /users/:id/visitors returns ok response when visitors exist ([3e554b0](https://github.com/rgxcp/wikalpa/commit/3e554b02329f2b3355fc6afdeca0ad7528646ac3))


### Reverts

* validate visiting self visitable ([7019610](https://github.com/rgxcp/wikalpa/commit/70196109d6c8cf278b607ad02954a51375ee31d0))

# [6.18.0](https://github.com/rgxcp/wikalpa/compare/v6.17.0...v6.18.0) (2022-01-17)


### Features

* allow VisitorWorker.perform_async to be enqueued into background job ([7c6fb18](https://github.com/rgxcp/wikalpa/commit/7c6fb182132f5ba9d7cfafbaf2dddffd6b712c52))
* enqueues visitor worker job in background when visiting community while user logged in ([757579c](https://github.com/rgxcp/wikalpa/commit/757579c50c3b83f0639f6c09e55881ea8b871bef))
* enqueues visitor worker job in background when visiting post while user logged in ([7b53d01](https://github.com/rgxcp/wikalpa/commit/7b53d01833df733505cd009559c5e3eb2f7d449b))
* enqueues visitor worker job in background when visiting user while user logged in ([ec445f3](https://github.com/rgxcp/wikalpa/commit/ec445f3728760daef26b64e4c5df01f1f1180ef7))
* VisitorWorker.perform adds visitable visitor by one ([31d7d06](https://github.com/rgxcp/wikalpa/commit/31d7d060a9a1fb13f992d69ff4a553298284bc07))

# [6.17.0](https://github.com/rgxcp/wikalpa/compare/v6.16.0...v6.17.0) (2022-01-16)


### Features

* add has many 'Visitor' polymorphic association on 'Community' ([83cc7f5](https://github.com/rgxcp/wikalpa/commit/83cc7f5dcf1389d9673fc54e0921d198807f0d72))
* add has many 'Visitor' polymorphic association on 'Post' ([3a23cf7](https://github.com/rgxcp/wikalpa/commit/3a23cf7209073b1fb4c31aede69fbef73e29dade))
* add has many 'Visitor' polymorphic association on 'User' ([3f11861](https://github.com/rgxcp/wikalpa/commit/3f11861120ad160f3ff98992335a6ef673f8756b))
* validate visiting self visitable ([dd8b85d](https://github.com/rgxcp/wikalpa/commit/dd8b85d1a38fb0646d291ba907091b12a78ff57a))

# [6.16.0](https://github.com/rgxcp/wikalpa/compare/v6.15.0...v6.16.0) (2022-01-16)


### Features

* add belongs to 'User' association on 'Visitor' ([43cb0ee](https://github.com/rgxcp/wikalpa/commit/43cb0ee1d818ac976e157da66e8379486de139b9))
* add polymorphic belongs to 'Visitable' association on 'Visitor' ([73b828f](https://github.com/rgxcp/wikalpa/commit/73b828f0208b46dab5a16756365cc81916c4d7da))
* validate presence of 'User' on 'Visitor' ([bdc1cc5](https://github.com/rgxcp/wikalpa/commit/bdc1cc5eec6f81afcb82faf1a40139cee6154a6d))

# [6.15.0](https://github.com/rgxcp/wikalpa/compare/v6.14.0...v6.15.0) (2022-01-10)


### Features

* add has many 'Comment' association on 'User' ([67933e6](https://github.com/rgxcp/wikalpa/commit/67933e6af28ddcb734472cb3987142abfba9b29e))
* add has many 'Community' through 'Member' association on 'User' ([76cea9c](https://github.com/rgxcp/wikalpa/commit/76cea9c4229ce2b9c932933b63caa38e4bf423b4))
* add has many 'Post' association on 'User' ([98e33fc](https://github.com/rgxcp/wikalpa/commit/98e33fce39b819a5bad437f802a36262877517e2))
* add has many 'Reply' association on 'User' ([006f055](https://github.com/rgxcp/wikalpa/commit/006f0558ed7af3a3277548019d6c8a70b1466f65))
* GET /users/:id/comments returns not found response when comments not exist ([2d3be40](https://github.com/rgxcp/wikalpa/commit/2d3be40aafd157d193a99ff0f723e019131b5e0f))
* GET /users/:id/comments returns not found response when user not exists ([3cc7f2c](https://github.com/rgxcp/wikalpa/commit/3cc7f2c833405dea1dc18993872bf56cf8dae890))
* GET /users/:id/comments returns ok response when comments exist ([3b46f06](https://github.com/rgxcp/wikalpa/commit/3b46f06be76fb2a8b71bba7ef4bf74a14d04cbf7))
* GET /users/:id/communities returns not found response when communities not exist ([7474648](https://github.com/rgxcp/wikalpa/commit/7474648775c8191bd762e184353608be05bbd5b1))
* GET /users/:id/communities returns not found response when user not exists ([37aeeb2](https://github.com/rgxcp/wikalpa/commit/37aeeb29dd337e77665cfd33cd6dfbd796c84233))
* GET /users/:id/communities returns ok response when communities exist ([c082c7e](https://github.com/rgxcp/wikalpa/commit/c082c7ea8d92c2ab1c1a35221e8d3e5a53cb350a))
* GET /users/:id/posts returns not found response when posts not exist ([920f211](https://github.com/rgxcp/wikalpa/commit/920f2116d387254b7a9a5f6fb0cf96dae053f9c1))
* GET /users/:id/posts returns not found response when user not exists ([f8d0a60](https://github.com/rgxcp/wikalpa/commit/f8d0a60b00e3ddd81705b169727720d11df8872e))
* GET /users/:id/posts returns ok response when posts exist ([dd3078d](https://github.com/rgxcp/wikalpa/commit/dd3078d098f0d9d9a81097eb1e2f7b6cc2b49b8a))
* GET /users/:id/replies returns not found response when replies not exist ([5279aa2](https://github.com/rgxcp/wikalpa/commit/5279aa2fe0ee714250c319ecfd95a59a5cc803a1))
* GET /users/:id/replies returns not found response when user not exists ([713acfc](https://github.com/rgxcp/wikalpa/commit/713acfc83f8005f27a1046fa5663f86f9bd18d47))
* GET /users/:id/replies returns ok response when replies exist ([b4b3f1e](https://github.com/rgxcp/wikalpa/commit/b4b3f1e50eab6aa963a13d92086ac4cf5fce6a6d))

# [6.14.0](https://github.com/rgxcp/wikalpa/compare/v6.13.0...v6.14.0) (2022-01-09)


### Features

* GET /comments/:id/likes returns not found response when comment not exists ([318cada](https://github.com/rgxcp/wikalpa/commit/318cadab29c250713ff83f6e807bbffc427ffafc))
* GET /comments/:id/likes returns not found response when likes not exist ([8fb25b0](https://github.com/rgxcp/wikalpa/commit/8fb25b0cca83f77d843b921ca551fe6abd080937))
* GET /comments/:id/likes returns ok response when likes exist ([69b4e57](https://github.com/rgxcp/wikalpa/commit/69b4e573c4abc688e698a0b29c826e98528dd00e))
* GET /posts/:id/likes returns not found response when likes not exist ([4adc644](https://github.com/rgxcp/wikalpa/commit/4adc64449392654e935820b0fd1c7c26f8f00046))
* GET /posts/:id/likes returns not found response when post not exists ([edea234](https://github.com/rgxcp/wikalpa/commit/edea23456497126988318503a27038a6fd72dbe6))
* GET /posts/:id/likes returns ok response when likes exist ([05cec20](https://github.com/rgxcp/wikalpa/commit/05cec209140875f385af01f5f55833f5d86fec03))
* GET /replies/:id/likes returns not found response when likes not exist ([156c440](https://github.com/rgxcp/wikalpa/commit/156c44090e0f2f6b34910ee2f5b131ac15e6b76e))
* GET /replies/:id/likes returns not found response when reply not exists ([ef57741](https://github.com/rgxcp/wikalpa/commit/ef577416abcd38b25b24efedd4c9563192a9414d))
* GET /replies/:id/likes returns ok response when likes exist ([40a2a0a](https://github.com/rgxcp/wikalpa/commit/40a2a0a455adf3fd9007a3563503ace618609316))

# [6.13.0](https://github.com/rgxcp/wikalpa/compare/v6.12.0...v6.13.0) (2022-01-09)


### Features

* GET /comments/:id/replies returns not found response when comment not exists ([18cefce](https://github.com/rgxcp/wikalpa/commit/18cefce91fa1d5e5e58dfc53647f7a9400a28c46))
* GET /comments/:id/replies returns not found response when replies not exist ([dc8f847](https://github.com/rgxcp/wikalpa/commit/dc8f8472d9f2961a837b72bedd5fab10120ed70f))
* GET /comments/:id/replies returns ok response when replies exist ([f95c2a1](https://github.com/rgxcp/wikalpa/commit/f95c2a19a85c1be1048e601e88f806690ce65287))

# [6.12.0](https://github.com/rgxcp/wikalpa/compare/v6.11.0...v6.12.0) (2022-01-09)


### Features

* GET /communities/:id/posts returns 200 status code when posts exist ([e850ef5](https://github.com/rgxcp/wikalpa/commit/e850ef50ea725f2aa6cbcfeb58448c9f0d0db734))
* GET /communities/:id/posts returns 404 status code when community not exists ([0e5c86c](https://github.com/rgxcp/wikalpa/commit/0e5c86c17426f1b58fd2e274772fb020db4ad91b))
* GET /communities/:id/posts returns 404 status code when posts not exist ([6cb9073](https://github.com/rgxcp/wikalpa/commit/6cb9073231ef503fc2529f856d3c100ec90849d4))
* GET /posts/:id/comments returns 200 status code when comments exist ([cff0831](https://github.com/rgxcp/wikalpa/commit/cff0831dd85a824749124287ff5875c392037b62))
* GET /posts/:id/comments returns 404 status code when comments not exist ([27fb576](https://github.com/rgxcp/wikalpa/commit/27fb576a511ee387a1051d4dab12e321d22d9d84))
* GET /posts/:id/comments returns 404 status code when post not exists ([e366959](https://github.com/rgxcp/wikalpa/commit/e3669590b1a2a97eeabab96c5f471f967035aac2))

# [6.11.0](https://github.com/rgxcp/wikalpa/compare/v6.10.0...v6.11.0) (2022-01-08)


### Features

* GET /communities/:id/members returns 200 status code when members exist ([51ee9cb](https://github.com/rgxcp/wikalpa/commit/51ee9cb47e00c6cbee52dfa01b3bd59d19b11591))
* GET /communities/:id/members returns 404 status code when community not exists ([cb99a5d](https://github.com/rgxcp/wikalpa/commit/cb99a5db24f75aef4c8a48c3ab88fa99ff7787c0))
* GET /communities/:id/members returns 404 status code when members not exist ([ab59532](https://github.com/rgxcp/wikalpa/commit/ab5953253d99cf9384cd8aa7c05f0649b7dd23c2))
* GET /users/:id/buddies returns 200 status code when buddies exist ([e1a8149](https://github.com/rgxcp/wikalpa/commit/e1a8149bae80d3b5c1d7e82e7455654137baddb0))
* GET /users/:id/buddies returns 404 status code when buddies not exist ([7baaee3](https://github.com/rgxcp/wikalpa/commit/7baaee34e8122bd401900d7f824f2e45b64f9671))
* GET /users/:id/buddies returns 404 status code when user not exists ([1f05a8a](https://github.com/rgxcp/wikalpa/commit/1f05a8acd5dcbbe402d0b646ee2e0ed89b3851cf))

# [6.10.0](https://github.com/rgxcp/wikalpa/compare/v6.9.0...v6.10.0) (2022-01-07)


### Features

* GET /communities returns 200 status code when communities exist ([6b68e82](https://github.com/rgxcp/wikalpa/commit/6b68e826e8aea9e9f148e8ab695dee8eb656392a))
* GET /communities returns 404 status code when communities not exist ([78e9369](https://github.com/rgxcp/wikalpa/commit/78e9369d1400660a386bb169f111b6bb3f8780c8))
* GET /posts returns 200 status code when posts exist ([ce65d08](https://github.com/rgxcp/wikalpa/commit/ce65d084827e595f4bdd845e3273f55150ec524d))
* GET /posts returns 404 status code when posts not exist ([fa71558](https://github.com/rgxcp/wikalpa/commit/fa71558cf2d3a283ea3b5e1ecadcf364f077fe7a))
* GET /users excludes password digest on users data ([c5f0488](https://github.com/rgxcp/wikalpa/commit/c5f04884c21c3b1ec80d6ec39755f9a40a82e4ab))
* GET /users returns 200 status code when users exist ([9bb7d4a](https://github.com/rgxcp/wikalpa/commit/9bb7d4a5e2a3027586dee227b53bbcb2605bd57a))
* GET /users returns 404 status code when users not exist ([6e2f43c](https://github.com/rgxcp/wikalpa/commit/6e2f43cd0b2223acfc771839655f1be34839dbfb))

# [6.9.0](https://github.com/rgxcp/wikalpa/compare/v6.8.0...v6.9.0) (2022-01-06)


### Features

* GET /replies/:id returns 200 status code when reply exists ([a047634](https://github.com/rgxcp/wikalpa/commit/a04763459362fb5675c1d48d7acd82ab6dd1ce6a))
* GET /replies/:id returns 404 status code when reply not exists ([6051ba1](https://github.com/rgxcp/wikalpa/commit/6051ba1c0857340e00da142fed7060d2af846fc8))


### Performance Improvements

* put repetitive finding reply into before action method ([98b2c2b](https://github.com/rgxcp/wikalpa/commit/98b2c2bbd6501fa98d457f22321503a6030d498d))

# [6.8.0](https://github.com/rgxcp/wikalpa/compare/v6.7.0...v6.8.0) (2022-01-06)


### Features

* GET /comments/:id returns 200 status code when comment exists ([5798708](https://github.com/rgxcp/wikalpa/commit/57987083d9f01eb341db8f3ef1e033dea2bdaaed))
* GET /comments/:id returns 404 status code when comment not exists ([dd90b09](https://github.com/rgxcp/wikalpa/commit/dd90b09e69daa9159299e40fbc97de30733ac4f3))


### Performance Improvements

* put repetitive finding comment into before action method ([8ade233](https://github.com/rgxcp/wikalpa/commit/8ade2330d5f3e29f5abab3209b15589e87b8d4b3))

# [6.7.0](https://github.com/rgxcp/wikalpa/compare/v6.6.0...v6.7.0) (2022-01-06)


### Features

* GET /posts/:id returns 200 status code when post exists ([f081013](https://github.com/rgxcp/wikalpa/commit/f081013a9d2c1a422ab64a4e8f34897ba8aa2a32))
* GET /posts/:id returns 404 status code when post not exists ([4e2d214](https://github.com/rgxcp/wikalpa/commit/4e2d21412103d3b38cada3384fe017fc34e7e50a))


### Performance Improvements

* put repetitive finding post into before action method ([b44b333](https://github.com/rgxcp/wikalpa/commit/b44b333031354c8ee51982f68442d8bff55746e5))

# [6.6.0](https://github.com/rgxcp/wikalpa/compare/v6.5.0...v6.6.0) (2022-01-06)


### Features

* GET /communities/:id returns 200 status code when community exists ([5f19a85](https://github.com/rgxcp/wikalpa/commit/5f19a858cd7884e8100256aff275acbb3c558b05))
* GET /communities/:id returns 404 status code when community not exists ([369b161](https://github.com/rgxcp/wikalpa/commit/369b161c7703b0f5459a356543f99c3be7cc1d70))


### Performance Improvements

* put repetitive finding community into before action method ([563b733](https://github.com/rgxcp/wikalpa/commit/563b733f9e2f3dfe1940d0692a9cb0b313445fa5))

# [6.5.0](https://github.com/rgxcp/wikalpa/compare/v6.4.0...v6.5.0) (2022-01-06)


### Features

* GET /users/:id excludes password digest on user data ([5a7461e](https://github.com/rgxcp/wikalpa/commit/5a7461e6bf77d7afa3ff9ab3099c54732c659849))
* GET /users/:id returns 200 status code when user exists ([3edb462](https://github.com/rgxcp/wikalpa/commit/3edb4622110dc3454ed2e7e13748568f8a9b98ee))
* GET /users/:id returns 404 status code when user not exists ([a501617](https://github.com/rgxcp/wikalpa/commit/a501617f04983cbd3a22b9a6e554f803ef313879))

# [6.4.0](https://github.com/rgxcp/wikalpa/compare/v6.3.0...v6.4.0) (2022-01-06)


### Features

* DELETE /likes/:id returns 200 status code when like exists ([def640f](https://github.com/rgxcp/wikalpa/commit/def640f6e9628c0504b59f4039c080ecf5573d77))
* DELETE /likes/:id returns 401 status code when user not logged in ([6dd60e7](https://github.com/rgxcp/wikalpa/commit/6dd60e7b5e5d4819d05b4908dd31ed4bbefc1662))
* DELETE /likes/:id returns 403 status code when deleting someone else like ([e09b936](https://github.com/rgxcp/wikalpa/commit/e09b936eafe55879b0720e6db32a7f992e15ea36))
* DELETE /likes/:id returns 404 status code when like not exists ([ddc8a40](https://github.com/rgxcp/wikalpa/commit/ddc8a40df14a8145b93fe2a7450b6ff5ac4807c9))

# [6.3.0](https://github.com/rgxcp/wikalpa/compare/v6.2.0...v6.3.0) (2022-01-05)


### Features

* add has many 'Like' polymorphic association on 'Reply' ([2b5aaf4](https://github.com/rgxcp/wikalpa/commit/2b5aaf45f0769e18226556fe56b3152bdfda0b18))
* POST /replies/:reply_id/likes likes a reply ([17709c0](https://github.com/rgxcp/wikalpa/commit/17709c039bca6b96e10f2d05824d8147bddf02cb))

# [6.2.0](https://github.com/rgxcp/wikalpa/compare/v6.1.0...v6.2.0) (2022-01-05)


### Features

* add has many 'Like' polymorphic association on 'Comment' ([f8a0fb5](https://github.com/rgxcp/wikalpa/commit/f8a0fb5a69908ad34e6986af0edb0c10ad72d856))
* POST /comments/:comment_id/likes likes a comment ([9c9edb5](https://github.com/rgxcp/wikalpa/commit/9c9edb5e5d017c0a7ab0f8c2d141d1bbbf3e96fe))

# [6.1.0](https://github.com/rgxcp/wikalpa/compare/v6.0.0...v6.1.0) (2022-01-05)


### Features

* add has many 'Like' polymorphic association on 'Post' ([fec6f2e](https://github.com/rgxcp/wikalpa/commit/fec6f2e7f5ec79e8aeac9c6e243bcebc9f0ffe9c))
* POST /posts/:post_id/likes returns 201 status code when entity valid ([4e66168](https://github.com/rgxcp/wikalpa/commit/4e66168b508e0b14031dd1d41163cccade481e56))
* POST /posts/:post_id/likes returns 401 status code when user not logged in ([4851259](https://github.com/rgxcp/wikalpa/commit/48512599eeffde37260a0893e2acc6391a68e9c5))
* POST /posts/:post_id/likes returns 404 status code when post not exists ([ca77525](https://github.com/rgxcp/wikalpa/commit/ca775257c9669ddfd6cd3938e2478cb3412a3078))
* POST /posts/:post_id/likes returns 422 status code when entity invalid ([5239ff3](https://github.com/rgxcp/wikalpa/commit/5239ff3f9599c19c5be12b33cf7ec624142c5823))

# [6.0.0](https://github.com/rgxcp/wikalpa/compare/v5.0.0...v6.0.0) (2022-01-04)


### Features

* move path for unfollowing user ([fd630f8](https://github.com/rgxcp/wikalpa/commit/fd630f82dad6714274eae0f0f5206856716eae6e))


### BREAKING CHANGES

* Path for unfollowing user from `DELETE
/users/:id/unfollow` was moved to `DELETE /buddies/:id`. The reason
behind this changes was to follow the REST-way.

Signed-off-by: Rommy Gustiawan <rgcppp@gmail.com>

# [5.0.0](https://github.com/rgxcp/wikalpa/compare/v4.0.0...v5.0.0) (2022-01-04)


### Features

* move path for leaving community ([444cf79](https://github.com/rgxcp/wikalpa/commit/444cf796795222ff2f2bdcf69a6496e9e730612f))


### BREAKING CHANGES

* Path for leaving community from `DELETE
/communities/:id/leave` was moved to `DELETE /members/:id`. The reason
behind this changes was to follow the REST-way.

Signed-off-by: Rommy Gustiawan <rgcppp@gmail.com>

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
