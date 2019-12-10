---
title: Hexo World 2
date: 2019-12-10 19:08:36
categories: Uncategorized
tags: hello
---

重新部署了博客、新购了域名以及其他。

<!--more-->

---

之前把静态博客部署在阿里云的轻量应用服务器上。后来想起来阿里云的轻量直到几个月前都还没有 Ubuntu 18.04 LTS 的镜像，还是觉得不完善（稳定），遂寻找其他服务商。

抛开昂贵的 [GCP] 和 [AWS]，我最喜欢的是 [Linode]。但是大陆的网络质量确实太难受了，我开始寻找低延迟的服务器提供商。比较令我满意的是 [Kvmla]，他们的服务器到大陆的延迟不仅很低，也很稳定。而且他们的 TOS 明确禁止搭建梯子，网络环境很好。但是我新装的 Ubuntu 18.04 LTS 居然无法直接使用 `iptables`：

    # iptables -L
    modprobe: FATAL: Module ip_tables not found in directory /lib/modules/4.4.0-62-generic
    iptables v1.6.1: can't initialize iptables table `filter': Table does not exist (do you need to insmod?)
    Perhaps iptables or your kernel needs to be upgraded.

发工单，回复让我从低版本升级上来。何必这么麻烦呢，这质量也让我“知难而退”。

最后还是选择了 [Linode]。通过[监控宝]观察了一周多，发现其实 Fremont 区的连接质量比 Tokyo 和 Singapore 都要好，最后还是回归了 Fremont 区（最早用 [Linode] 就是选的 Fremont）。

---

趁着 [Gandi.net] 打折，新购了域名 `abreto.science`，并续了四年，刚好覆盖硕士研究生阶段。此博客将挂在 https://blog.abreto.science。

之前的 [WordPress] 博客仍打算挂在 https://blog.abreto.net。目前的打算是 `abreto.net` 部署一些更偏生活的内容，`abreto.science` 可能更多地作为一个学术主页的角色。

再早一段时间的 [Drupal] 博客由于数据早已佚失，就不再恢复了。我的第一版博客大概是在 2010 年上线的，当时还是用的虚拟主机，也备了案，后来上了高中忘了续费数据就丢了。不过很庆幸 [Wayback Machine] 居然有那时候的快照，因为是黑历史，就不说具体如何查找了。

回过头看过去的自己的时候，总是觉得好幼稚。

[GCP]: https://cloud.google.com/
[AWS]: https://aws.amazon.com/
[Linode]: https://www.linode.com/?r=92bda32babbde5e08c3502cd998fcb81cce26979
[Kvmla]: https://www.kvmla.com/aff.php?aff=2886
[监控宝]: https://www.jiankongbao.com/
[Gandi.net]: https://www.gandi.net/
[WordPress]: https://wordpress.org/
[Drupal]: https://www.drupal.org/
[Wayback Machine]: https://web.archive.org/