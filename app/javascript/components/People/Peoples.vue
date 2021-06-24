<template>
    <div>
        <div>
            <input v-model="search" type="search" class="input is-light" placeholder="Search by name" />                                
        </div>
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Peoples</h4>
                                    <br>
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="card-body">
                            
                        </div>
                        <div>
                            <ul class="list">
                                <li class="card" @click="showPeople(people.id)" v-for="people in peoples" :key="people.name">
                                    <div>
                                    </div>
                                        <img class="img" :src="img + people.profile_path">
                                    <div>
                                    <div>
                                        <a class="card">
                                            <h3>{{people.name}}</h3>
                                        </a> 
                                    </div>
                                    <div>
                                        <p><i class="fas fa-star"></i>{{people.popularity}}</p>
                                    </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
    export default {
        name: 'Peoples',
        data(){
            return{
                peoples: [],
                img: '',
                search: ''
            }
        },
        props: {
            data: {
                type: Array
            }
        },
        mounted() {
            axios.get('https://api.themoviedb.org/3/person/popular?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US&page=1').then(response => {
                this.peoples = response.data.results, 
                console.log(response.data.results) 
            })
            this.img = "https://image.tmdb.org/t/p/w500"
            
        },
        methods:{
            showList: function (event) {
                window.location = '/' 
            },
            showPeople: function (id) {
                window.location = '/peoples/' + id 
            },
        watch:{
            search: function(val, oldVal) {
                if(val.length > 2) {
                    this.getContacts(val)
                }
            },
             getContacts(name) {
                axios.get('/api/v1/contacts?filter=' + name + '&fields=id,name,phone,email,details,user_id')
                .then(response => {
                this.contacts = response.data
                })
            },
        }
        }
    }
</script>
<style>
.table td{
    cursor: pointer;
    padding-top: 15px;
}
.table img{
    width: 72px;
    height: auto;
}

.table{
    padding: 100px;
}
</style>