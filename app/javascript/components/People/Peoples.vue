<template>
    <div>
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Pessoas</h4>
                                    <br>
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="card-body">
                            
                        </div>
                        <div>
                            <div class="list">
                                <div class="card list-item" @click="showPeople(people.id)" v-for="people in peoples" :key="people.name">
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
                                </div>
                            </div>
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
    },
    watch:{
        search: function(val, oldVal) {
            if(val.length > 2) {
                this.getContacts(val)
            }
        }
    }
}
</script>
<style>
list{
    cursor: pointer;
    margin-top: 20px;
    list-style: none;
}
.list .list-item:hover{
    transition: 0.5s;
    transform: scale(1.03);
}
.img{
    width: 72px;
    height: auto;
    left: 0;
    top: 0;
    bottom: 0;
}
.list .list-item{
    list-style: none;
    margin-top: 15px;
    box-shadow: 1px 1px 1px 1px rgb(0 0 0 / 56%), 0 4px 25px 0 rgb(0 0 0 / 12%), 0 8px 10px -5px rgb(0 0 0 / 20%);
    border-radius: 15px;
}
</style>