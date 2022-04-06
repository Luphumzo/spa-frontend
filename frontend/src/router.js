import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
    {
        path: "",
        name: "Login",
        component: () => import("@/views/Login.vue"),
        meta: {
            layout: "full"
        }
    },
    {
        path: "/register",
        name: "Register",
        component: () => import("@/views/Register.vue"),
        meta: {
            layout: "full"
        }
    },
    {
        path: "/contact-us",
        name: "ContactUs",
        component: () => import("@/views/ContactUsForm.vue"),
        meta: {
            layout: "full"
        }
    },
    {
        path: "/dashboard",
        name: "dashboard",
        component: () => import("@/views/Home.vue"),
        meta: {
            pageTitle: "Home",
            breadcrumb: [
                {
                    text: "Home",
                    active: true
                }
            ]
        }
    }
];

const router = new VueRouter({
    mode: "history",
    routes: routes
});

// router.beforeEach((to, from, next) => {
//     if (to.name !== "Login" && !isAuthenticated) {
//         next({ name: "Login" });
//     } else {
//         console.log("Not Authed 2");
//         next();
//     }
// });

router.afterEach(() => {
    // Remove initial loading
    const appLoading = document.getElementById("loading-bg");
    if (appLoading) {
        appLoading.style.display = "none";
    }
});

export default router;
