#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require jquery.autosize
#= require jquery.validate
#= require jquery.timeago
#= require bootstrapValidator
#= require nprogress
#= require jquery-migrate-1.2.1.min
#= require social-share-button
#= require qrcode.min
#= require script
#= require_tree ./locales
#= require_tree ./plugins



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


