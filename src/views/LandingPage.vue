<template>
  <div class="h-screen flex">
    <contact-us-form />
    <login-form />
  </div>
</template>

<script>
import ContactUsForm from "./../components/ContactUsForm.vue";
import LoginForm from "./../components/LoginForm.vue";
export default {
  name: "LandingPage",
  components: {
    ContactUsForm,
    LoginForm,
  },
};
</script>
