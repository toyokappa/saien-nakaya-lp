<template lang="pug">
section.section.bg-dark
  h2.t-center.f-24.mb-3 お問い合わせ
  .container
    form
      .mb-2
        label.input-label(form="name")
          span.text お名前
          span.required 必須
        input.input-field(
          type="text"
          name="name"
          id="name"
          :class="{ invalid: nameError }"
          v-model="name"
        )
        .invalid-feedback(v-if="nameError") {{ nameError }}
      .mb-2
        label.input-label(form="email")
          span.text メールアドレス
          span.required 必須
        input.input-field(
          type="email"
          name="email"
          id="email"
          :class="{ invalid: emailError }"
          v-model="email"
        )
        .invalid-feedback(v-if="emailError") {{ emailError }}
      .mb-2
        label.input-label(form="message")
          span メッセージ
        textarea.input-field(
          rows="3"
          name="message"
          id="message"
          v-model="message"
        )
      button.button-submit(
        :disabled="!meta.valid"
      ) 送信する
</template>

<script setup>
import { useField, useForm, configure } from "vee-validate";
import { localize } from "@vee-validate/i18n";

const { meta } = useForm();
const { value: name, errorMessage: nameError } = useField("name", "required");
const { value: email, errorMessage: emailError } = useField(
  "email",
  "required|email"
);
const { value: message } = useField("message");

configure({
  generateMessage: localize({
    ja: {
      names: {
        name: "お名前",
        email: "メールアドレス",
        message: "メッセージ",
      },
    },
  }),
});

const { serviceName, host, domain, mailgunKey, mailBcc } =
  useRuntimeConfig().public;

const sendMail = async () => {
  // loading
  const subject = `【${serviceName}】お問い合わせを受け付けました`;
  const text = `
以下の内容でホームページよりお問い合わせを受け付けました。
入力いただいた内容をもとに担当からご連絡いたしますので今しばらくお待ち下さい。

---
# お名前
${name.value} 様

# メールアドレス
${email.value}

# ご質問など
${message.value || ""}
---

引き続き${serviceName}をよろしくお願いいたします！

※ こちらのメールへの返信は受け付けておりません。

====================================

# ${serviceName} 公式サイト
${host}

====================================
`;
  const formData = new FormData();
  formData.append(
    "from",
    `${serviceName} お問い合わせフォーム <info@${domain}>`
  );
  formData.append("to", email.value);
  formData.append("bcc", mailBcc);
  formData.append("subject", subject);
  formData.append("text", text);
  try {
    const url = `https://api.mailgun.net/v3/mg.${domain}/messages`;
    await $fetch(url, {
      method: "POST",
      body: formData,
      headers: {
        Authorization: "Basic " + btoa(`api:${mailgunKey}`),
      },
    });
    // トースト
  } catch (err) {
    // トースト
    throw err;
  } finally {
    // ローディング終了
  }
};
</script>
