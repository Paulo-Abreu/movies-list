<template>
    <div>
        <table  class="card" id="create_form">
            <tr class="card-content">
                <th class="card-title" id="title" colspan="2">Formulario de Criar Filme</th>
            </tr>

            <tr class="card-content">
                <td><label class="label">Title</label></td>
                <td><input class="input is-ligth" name="name" type="text" placeholder="Name" v-model="newObject.title"></td>
            </tr>


            <tr class="card-content">
                <td><label class="label">Overview</label></td>
                <td><input class="input is-ligth" name="overview" type="text" placeholder="Email" v-model="newObject.overview"></td>
            </tr>

            <tr class="card-content">
                <td><label class="label">Vote Average</label> </td>
                <td><input class="input is-ligth" name="votes" type="number" placeholder="Details" v-model="newObject.vote_average"></td>
            </tr>

            <tr class="card-content">
                <td><label class="label">Poster</label> </td>
                <td><input class="input is-ligth" name="poster" type="text" placeholder="image" v-model="newObject.poster_path"></td>
            </tr>
            <br>
            <br>
            <button  class="button is-ligth" id="button" @click="submitForm()">Criar Contato!</button><br><br>
            <button  class="button is-ligth" id="button" @click="showList">Back</button>
        </table><br>
    </div>

</template>

<script>
import axios from 'axios';
    export default{
        name: 'MoviesForm',
        data(){
            return{
                newObject: {
                    title: '',
                    overview: '',
                    vote_average: '',
                    poster_path:''
                }
            }
        },
        props: {
            data: {
                type: Array
            }
        },
        methods: {
            submitForm: function (event) {
                axios.post('/api/v1/movies', {movie: this.newObject})
                .then(response => {window.location = '/', console.log(response) })
            },
            showList: function () {
                window.location = '/'
            }
        },
    }
</script>

<style>
.content table{
    width: 800px;
}
#title{
    background: rgb(142, 148, 147);
    color: white;
}
</style>