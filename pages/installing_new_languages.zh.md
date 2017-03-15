---
layout: default
title: Installing new languages
permalink: /installing-new-languages/
redirect_from:
  - /installing_new_languages.html
sitemap:
    priority: 0.7
    lastmod: 2014-12-10T00:00:00-00:00
---

# 国际化

## 介绍

在生成项目的时候，你会被问到是否需要国际化的支持。

如果启用它，你需要先选择你的本地的语言作为默认语言， 之后，你可以选择你想安装的其他语言。 如果你不想从一开始就支持任何额外的语言，你可以在需要的时候通过运行语言子生成器来添加语言。

如果你确定你永远不会把这个应用程序转换成另一种语言，你一个选择不使用国际化。

## 支持的语言s

这些都是当前支持的语言

*   Catalan
*   Chinese (Simplified)a
*   Chinese (Traditional)
*   Danish
*   Galician
*   German
*   Greek
*   Hindi
*   Italian
*   Japanese
*   Hindi
*   Hungarian
*   Korean
*   Marathi
*   Netherlands
*   Polish
*   Portuguese
*   Portuguese (Brazilian)
*   Russian
*   Romanian
*   Spanish
*   Swedish
*   Tamil
*   Turkish

## How to add languages after project generation? 如何在项目生成后添加语言？

你可以使用 languages 子生成器:

`yo jhipster:languages`

![]({{site.url}}/images/install_new_languages.png)

请注意，你需要重新生成你的实体，如果你想把它们翻译成你刚才添加的语言.

## 如何添加不支持的新语言？

所有的语言都存放在`src/main/webapp/i18n` (客户端) and `src/main/resources/i18n` (服务端)

这里是安装一个新的语言的步骤 `new_lang`:

1.  复制 `src/main/webapp/i18/en` 文件后重命名为 `src/main/webapp/i18/new_lang` (这是前端多语言存放的地方)
2.  翻译在文件夹下所有的文件 `src/main/webapp/i18/new_lang`文件夹下所有的文件
3.  添加语种 `new_lang` 在 `LANGUAGES` 的 constant 定义 `src/main/webapp/app/components/language/language.constants.js`

    ```
    .constant('LANGUAGES', [
        'en',
        'fr',
        'new_lang'
        // jhipster-needle-i18n-language-constant - JHipster will add/remove languages in this array
    ]
    ```

4.  在 `src/main/resources/i18n` 文件夹中，复制 `messages_en.properties` 文件到 `messages_new_lang.properties` (这是服务端多语言存放的地方)
5.  在`messages_new_lang.properties` 文件中，翻译所有的 key 对应的值
6.  在 `src/main/webapp/app/components/language/language.filter.js` 文件下的`filter('findLanguageFromKey')`函数中添加新语言的名字

    ```
    function findLanguageFromKeyFilter(lang) {
        return {
            'ca': 'Català',
            'da': 'Dansk',
            'de': 'Deutsch',
            'el': 'Ελληνικά',
            'en': 'English',
            'es': 'Español',
            'fr': 'Français',
            'gl': 'Galego',
            'hu': 'Magyar',
            'hi': 'हिंदी',
            'it': 'Italiano',
            'ja': '日本語',
            'ko': '한국어',
            'mr': 'मराठी',
            'nl': 'Nederlands',
            'pl': 'Polski',
            'pt-br': 'Português (Brasil)',
            'pt-pt': 'Português',
            'ro': 'Română',
            'ru': 'Русский',
            'sv': 'Svenska',
            'ta': 'தமிழ்',
            'tr': 'Türkçe',
            'zh-cn': '中文（简体）',
            'zh-tw': '繁體中文'
        }[lang];
    }
    ```

新语言`new_lang` 在语言的菜单中了，并且适用于前后端。

## 如何移除一个已经存在的 语言

下面是删除一个语言的步骤 `old_lang`:

1.  从`src/main/webapp/i18/old_lang` 文件删除你的语言
2.  在`src/main/webapp/app/components/language/language.constants.js` 的 constant 中删除你的语言
3.  删除 `src/main/resources/i18n/messages_old_lang.properties` 文件