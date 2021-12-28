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
