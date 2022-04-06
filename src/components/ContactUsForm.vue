<template>
  <div
    class="flex w-1/2 bg-gradient-to-tr from-blue-800 to-purple-700 i justify-around items-center"
  >
    <form @submit.prevent="submit">
      <div class="mb-4">
        <h1 class="text-white font-bold text-4xl font-sans">Contact Us</h1>
        <p class="text-white mt-1">
          Please don't hesitate do contact us, we'll drop you an email in less
          the 24 hours.
        </p>
      </div>
      <div class="flex items-center border-2 py-2 px-3 rounded-2xl mb-4">
        <input
          v-model="form.name"
          class="pl-2 outline-none border-none bg-transparent text-white"
          type="text"
          name=""
          id=""
          placeholder="Name"
        />
      </div>
      <div class="flex items-center border-2 py-2 px-3 rounded-2xl mb-4">
        <input
          v-model="form.email"
          class="pl-2 outline-none border-none bg-transparent text-white"
          type="text"
          name=""
          id=""
          placeholder="Email Address"
        />
      </div>
      <div class="flex items-center border-2 py-2 px-3 rounded-2xl mb-4">
        <input
          v-model="form.gender"
          class="pl-2 outline-none border-none bg-transparent text-white"
          type="text"
          name=""
          id=""
          placeholder="Gender"
        />
      </div>

      <div class="flex items-center border-2 py-2 px-3 rounded-2xl">
        <textarea
          v-model="form.content"
          class="pl-2 outline-none border-none bg-transparent text-white w-full h-full"
          type="text"
          name=""
          id=""
          placeholder="Content"
        />
      </div>
      <button
        type="submit"
        class="block w-28 bg-white text-indigo-800 mt-4 py-2 rounded-2xl font-bold mb-2"
      >
        Submit
      </button>
    </form>
  </div>
</template>
<script>
export default {
  name: "ContactUsForm",
  data() {
    return {
      form: {
        name: null,
        email: null,
        gender: null,
        content: null,
      },
    };
  },
  methods: {
    async submit() {
      console.log(this.form);
      await this.axios
        .post("http://127.0.0.1:8000/api/saveContactDetails", this.form, {
          headers: {
            "Content-type": "application/json",
          },
        })
        .then((response) => {
          console.log(response);
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
