import { AbilityBuilder } from "casl";

const rights = {
    setRights(user) {
        return AbilityBuilder.define((can, cannot) => {
            if (user != null)
                switch (user.role) {
                    case 1: //Member
                        can(
                            ["read", "create", "update", "delete"],
                            "Dashboard"
                        );
                        can(
                            ["read", "create", "update", "delete"],
                            "Recieved Leaves"
                        );
                        break;
                    case 2: //Member
                        can(
                            ["read", "create", "update", "delete"],
                            "Dashboard"
                        );
                        can(
                            ["read", "create", "update", "delete"],
                            "Apply Leave"
                        );
                        break;
                }
        });
    }
};

export default rights;
