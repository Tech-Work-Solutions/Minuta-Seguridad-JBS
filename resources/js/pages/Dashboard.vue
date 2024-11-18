<template>
  <div>
    <sidebar />
    <div class="relative md:ml-64">
      <admin-navbar />
      <div class="px-4 md:px-16 mx-auto w-full -mt-24 ">       
        <transition name="fade" mode="out-in"> 
          <router-view class="main-view" name="MainView"></router-view>  
        </transition>        
      </div> 
    </div>
  </div>
</template>
<script>
import AdminNavbar from "./admin/dashboard/navbars/AdminNavbar.vue";
import Sidebar from "./admin/dashboard/sidebar/Sidebar.vue";
import FooterAdmin from "./admin/dashboard/footers/FooterAdmin.vue";
export default {
  name: "admin-layout",
  components: {
    AdminNavbar,
    Sidebar,
    FooterAdmin,
  },
};
</script>
