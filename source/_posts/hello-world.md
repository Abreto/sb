---
title: Hexo World
date: 2019/11/26
categories: Uncategorized
tags: hello
---

最近 [WordPress] 升级到了 5.3 版本，使用的 Markdown 插件小小地挂了一下，并且被我发现有 Bug。心情很不爽，在用了九年 [WordPress] 后，我觉得是时候切换到静态博客了。

<!--more-->

[Hexo] 并不是我心中理想的静态博客，它太过静态。我比较青睐于 [VuePress] 这种，页面里可以内嵌 Vue 代码，我可以灵活地插入一些内容。但 [VuePress] 没有开箱即用的适合博客的构建方式，且我对 Vue 不是很熟悉，这给我的自定义增加了工作量。我对 React 要更熟悉一些，下一步我可能会考虑熟悉熟悉 [Gatsby]，然后形成自己的博客系统。[Hexo] 只是一个临时过渡。

我以前一直把博客部署在 [Linode]。经过六年的使用，我觉得它太远了。这次尝试了下阿里云的轻量应用服务器（也许我还可以尝试下 [Linode] 在新加坡的节点）。切换到静态博客后，每次修改源代码后都要重新部署一遍，于是搭建了一个 [Jenkins] 用来自动部署。以前一直在用 [GitLab] 的 CI/CD，对 [Jenkins] 很不熟悉，踩了很多坑，有空把一些值得说的部分拿出来写一下。（我还发现了我一直错用了 `sh -c`）

我需要博客能渲染 $\LaTeX$ 格式的数学公式，这点上 [Hexo] 很不友好，没有现成的插件提供了对 $\KaTeX$ 开箱即用的支持（[KaTeX vs MathJax]）。我只好自己临时糊了一个 [hexo-renderer-markdown-it-katex] 出来，顺便代替默认的 `marked` 渲染器。

这篇博客满满的都是对 [Hexo] 的怨念，现在已经 01:44 了，我想我可以下班了。

上次数据丢失重建博客是高考后，这次切换到静态博客恰好是刚来到实验室实习的时候，天意如此吧！

[WordPress]: https://wordpress.org
[Hexo]: https://hexo.io
[VuePress]: https://vuepress.vuejs.org/
[Gatsby]: https://www.gatsbyjs.org/
[Linode]: https://www.linode.com
[GitLab]: https://about.gitlab.com
[Jenkins]: https://jenkins.io
[hexo-renderer-markdown-it-katex]: https://github.com/Abreto/hexo-renderer-markdown-it-katex
[KaTeX vs MathJax]: https://www.intmath.com/cg5/katex-mathjax-comparison.php
