import Vue3Toastify, { toast } from 'vue3-toastify';
import 'vue3-toastify/dist/index.css';

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.use(Vue3Toastify, {
    autoClose: 3000,
    position: 'bottom-center',
    hideProgressBar: true,
    theme: 'colored',
  });

  return {
    provide: { toast },
  };
});