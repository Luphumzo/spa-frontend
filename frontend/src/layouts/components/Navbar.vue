<template>
    <div class="navbar-container d-flex content align-items-center">
        <!-- Nav Menu Toggler -->
        <ul class="nav navbar-nav d-xl-none">
            <li class="nav-item">
                <b-link class="nav-link" @click="toggleVerticalMenuActive">
                    <feather-icon icon="MenuIcon" size="21" />
                </b-link>
            </li>
        </ul>

        <!-- Left Col -->
        <div
            class="bookmark-wrapper align-items-center flex-grow-1 d-none d-lg-flex"
        >
            <dark-Toggler class="d-none d-lg-block" />
        </div>

        <b-navbar-nav class="nav align-items-center ml-auto">
            <b-nav-item-dropdown
                right
                toggle-class="d-flex align-items-center dropdown-user-link"
                class="dropdown-user"
            >
                <template #button-content>
                    <div class="d-sm-flex d-none user-nav">
                        <p class="user-name font-weight-bolder mb-0">
                            {{ username }}
                        </p>
                        <span class="user-status">{{ email }}</span>
                        <span class="user-status">{{ role }}</span>
                    </div>
                </template>

                <b-dropdown-item
                    link-class="d-flex align-items-center"
                    @click="logout()"
                >
                    <feather-icon size="16" icon="LogOutIcon" class="mr-50" />
                    <span>Logout</span>
                </b-dropdown-item>
            </b-nav-item-dropdown>
        </b-navbar-nav>
    </div>
</template>

<script>
import {
    BLink,
    BNavbarNav,
    BNavItemDropdown,
    BDropdownItem,
    BDropdownDivider,
    BAvatar
} from "bootstrap-vue";
import DarkToggler from "@core/layouts/components/app-navbar/components/DarkToggler.vue";
import ToastificationContent from "@core/components/toastification/ToastificationContent.vue";
export default {
    components: {
        BLink,
        BNavbarNav,
        BNavItemDropdown,
        BDropdownItem,
        BDropdownDivider,
        BAvatar,
        ToastificationContent,
        // Navbar Components
        DarkToggler
    },
    props: {
        toggleVerticalMenuActive: {
            type: Function,
            default: () => {}
        }
    },
    computed: {
        username() {
            return this.$store.getters["auth/user"]["name"];
        },
        email() {
            return this.$store.getters["auth/user"]["email"];
        },
        role() {
            return this.$store.getters["auth/user"]["role"] == 1
                ? "Admin"
                : "Employee";
        },
        token() {
            return this.$store.getters["auth/user_token"];
        }
    },
    methods: {
        logout() {
            this.axios
                .post("http://127.0.0.1:8000/api/logout", {
                    headers: {
                        Accept: "application/json",
                        Authorization: `Bearer ${this.token}`
                    }
                })
                .then(response => {
                    console.log(response);
                    this.$router.push("/");
                    this.$toast({
                        component: ToastificationContent,
                        props: {
                            title: "Failed",
                            icon: "EditIcon",
                            variant: response.data
                        }
                    });
                });
        }
    }
};
</script>
