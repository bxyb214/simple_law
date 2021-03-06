#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery.autosize
#= require jquery.validate
#= require jquery.timeago
#= require bootstrapValidator
#= require bootstrap-hover-dropdown
#= require nprogress
#= require jquery-migrate-1.2.1.min
#= require social-share-button
#= require qrcode.min
#= require script
#= require_tree ./locales



$ ->
  console.log "对源代码感兴趣？更多关于本站技术栈信息请参考: https://github.com/bxyb214/simplelaw"

$(document).on 'page:update', ->
  $('[data-behaviors~=autosize]').autosize()

  $("time[data-behaviors~=timeago]").timeago()

$(document).on 'page:fetch', ->
  NProgress.start()
$(document).on 'page:change', ->
  NProgress.done()
$(document).on 'page:restore', ->
  NProgress.remove()


