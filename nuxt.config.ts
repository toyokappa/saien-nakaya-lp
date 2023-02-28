const domain = "saien-nakaya.com"
const host = `https://${domain}`
const projectName = "彩園なかや"
const serviceName = "彩園なかや"
const pageTitle = `${serviceName} | 数式と農業で食卓を支えるネギ専門農家`
const description = " 「畑を拓き、人を育てる」を農場理念に掲げ、野菜栽培に数式を取り入れた「数式ネギ」を展開している群馬県前橋市のネギ専門農家です。"
const mailBcc = ""

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  ssr: false,
  css: [
    "@/assets/styles/reset.css",
  ],
  vite: {
    css: {
      preprocessorOptions: {
        sass: {
          additionalData: '@import "@/assets/styles/main.sass"'
        }
      }
    },
  },
    app: {
    head: {
      title: pageTitle,
      htmlAttrs: {
        lang: 'ja'
      },
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { hid: 'description', name: 'description', content: description },
        { name: 'keywords', content: '群馬,前橋,大胡,樋越,ねぎ,農家'}, 
        { name: 'apple-mobile-web-app-title', content: '彩園なかや' },
        { name: 'application-name', content: '彩園なかや' },
        { name: 'msapplication-TileColor', content: '#ff9900' },
        { name: 'theme-color', content: '#ffffff' },
      ],
      link: [
        { rel: 'apple-touch-icon', sizes: '180x180', href: '/apple-touch-icon.png' },
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'icon', type: 'image/png', sizes: '32x32', href: '/favicon-32x32.png' },
        { rel: 'icon', type: 'image/png', sizes: '16x16', href: '/favicon-16x16.png' },
        { rel: 'manifest', href: '/site.webmanifest' },
        { rel: 'mask-icon', href: '/safari-pinned-tab.svg', color: '#5bbad5' },
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;700&family=Sawarabi+Mincho&display=swap' },
        { rel: 'canonical', href: `https://${domain}` },
      ],
    }
  },
  runtimeConfig: {
    public: {
      domain,
      host,
      serviceName,
      mailgunKey: process.env.MAILGUN_KEY,
      mailBcc: process.env.MAIL_BCC,
    }
  },
  router: {
    options: {
      strict: true
    }
  },
})
