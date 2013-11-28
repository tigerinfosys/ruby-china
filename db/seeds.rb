# coding: utf-8

# 默认配置项
# 如需新增设置项，请在这里初始化默认值，然后到后台修改
# 首页
# SiteConfig.index_html
SiteConfig.save_default("index_html",<<-eos
<div class="box" style="text-align:center;">
  <p><img alt="Big_logo" src="/assets/big_logo.png"></p>
  <p></p>
  <p>52jita，致力于构建完善的吉他中文社区。</p>
  <p>功能正在完善中，欢迎使用和您的宝贵建议 。</p>
  <p>诚邀有激情的活跃吉他爱好者参与维护社区，有意者请到社区反馈版块发帖留言</p>
</div>
eos
)

# Wiki 首页 HTML
SiteConfig.save_default("wiki_index_html",<<-eos
<div class="box">
  Wiki Home page.
</div>
eos
)

# Footer HTML
SiteConfig.save_default("footer_html",<<-eos
  <img src="/assets/52jita/footer_bg.jpg">
  <p class="copyright"> 爱吉他 ©2013 版权所有 </p>
  <p class="copyright">Copyright ©2013 52jita | All rights reserved.</p>
eos
)

# 话题后面的HTML代码
# SiteConfig.save_default("after_topic_html",<<-eos
# <div class="share_links">
#   <a href="https://twitter.com/share" class="twitter-share-button" data-count="none"">Tweet</a>
#   <script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
# </div>
# eos
# )

# 话题正文前面的HTML
SiteConfig.save_default("before_topic_html",<<-eos
eos
)

# 话题列表首页边栏HTML
SiteConfig.save_default("topic_index_sidebar_html",<<-eos
<div class="box">
  <h2>公告</h2>
  <div class="content">
    Hello world.
  </div>
</div>

<div class="box">
  <h2>置顶话题</h2>
  <ul class="content">
    <li><a href="/topics/1">Foo bar</a></li>
  </ul>
</div>
eos
)

# 酷站列表首页头的HTML
SiteConfig.save_default("site_index_html",<<-eos
下面列出了有趣的吉他网站和社区, 如果你知道还有不在此列表的，请帮忙补充。
eos
)

# 自定有 HTML head 区域的内容
SiteConfig.save_default("custom_head_html",<<-eos
<link rel="dns-prefetch" href="//assets.youhost.com">
eos
)

# 要在论坛首页列表隐藏的节点,以逗号隔开
SiteConfig.save_default("node_ids_hide_in_topics_index","")

# Sidebar 新建话题按钮，下拉显示的节点列表
SiteConfig.save_default("new_topic_dropdown_node_ids","(1,4,5,7,12,13)")

# 禁止回复的某些词语
SiteConfig.save_default("ban_words_on_reply","mark\n收藏\n顶\n赞\nup\n")

# 随机显示的 tip 信息
SiteConfig.save_default("tips","坚持就是胜利\n练吉他是耐力活")

SiteConfig.save_default("newbie_notices",%(<p>为提高社区质量，请新人发帖时注意：</p>
    <ol style="color:#ad2b2d;">
      <li>请选择合适的节点，尽量不要发重复的话题；</li>
      <li>请遵守国家法律法规，不要发广告等无关话题；</li>
    </ol>
    <p>请在新人阶段多浏览，看看其他老用户是如何在社区里面分享与解决问题的。</p>))

SiteConfig.save_default("reject_newbie_reply_in_the_evening", "false")

# ========================= init Section, Node =========================
s1 = Section.create(:name => "设备器材")
Node.create(:name => "木吉他", :summary => "the nature music", :section_id => s1.id)
Node.create(:name => "电吉他", :summary => "the best thing man made", :section_id => s1.id)
Node.create(:name => "尤克里里", :summary => "small and cute", :section_id => s1.id)
Node.create(:name => "吉他周边", :summary => "...", :section_id => s1.id)
Node.create(:name => "交易", :summary => "...", :section_id => s1.id)

s2 = Section.create(:name => "音乐天地")
Node.create(:name => "乐理知识", :summary => "...", :section_id => s2.id)
Node.create(:name => "弹唱", :summary => "...", :section_id => s2.id)
Node.create(:name => "指弹", :summary => "...", :section_id => s2.id)
Node.create(:name => "我的作品", :summary => "...", :section_id => s2.id)
Node.create(:name => "影视精品", :summary => "...", :section_id => s2.id)
Node.create(:name => "曲谱", :summary => "...", :section_id => s2.id)
Node.create(:name => "资源", :summary => "...", :section_id => s2.id)

s3 = Section.create(:name => "站务")
announce_node = Node.create(:name => "公告", :summary => "...", :section_id => s3.id)
Node.create(:name => "反馈", :summary => "...", :section_id => s3.id)
Node.create(:name => "开发", :summary => "...", :section_id => s3.id)

SiteNode.create(:name => "国内吉他网站", :sort => 100)
SiteNode.create(:name => "国外吉他网站", :sort => 99)
SiteNode.create(:name => "名人明星", :sort => 97)
SiteNode.create(:name => "其他", :sort => 94)

Topic.create(
  :title => "52jita 上线啦",
  :node_id => announce_node.id,
  :body => "52jita 上线啦，这是一个吉他爱好者的乐园，希望大家能在这里学好琴，交到朋友。welcome！",
  :user_id => 1,
  :replies_count => 1,
  :last_reply_user_id => 1,
  :replied_at => Time.now - 1,
  :source => "source",
  :created_at => Time.now - 1,
  :updated_at => Time.now - 1
)

User.create(
  :email => "feitian124@gmail.com",
  :name => "feitian124",
  :location => "shanghai",
  :bio => "",
  :website => "",
  #:avatar_file_name => "",
  :verified => false,
  :state => 1,
  #:qq => "",
  :tagline => "",
  :created_at => Time.now - 30,
  :updated_at => Time.now - 30,
  #:crypted_password => "",
  #:password_salt => "",
  #:persistence_token => "",
  #:single_access_token => "",
  #:perishable_token => "",
  #:login_count => 20,
  #:failed_login_count => 0,
  #:notes_count => 10
)
