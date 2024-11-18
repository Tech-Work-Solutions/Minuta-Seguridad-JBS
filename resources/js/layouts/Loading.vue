<template>
    <div class="loading-wrap">
        <div class="loading">
            <div class="title">
                Cargando...
            </div>
            <div class="loading-dots">
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
            </div>
        </div>
    </div>
</template>


<style scoped>
.loading-wrap{
    height: 100vh;
    position: relative;
    background-color: #000;
}

.loading{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
}

.title{
    font-size: 18px;
    color: #fff;
    font-weight: 600;
}

.dot{
    height: 25px;
    width: 25px;
    border-radius: 50%;
    background-color: #bbb;
    display: inline-block; 
    animation: blink 1.4s infinite;

}

@keyframes blink {
    0%{
        opacity: 0.2;
    }
    20%{
        opacity: 1;
    }
    80%{
        opacity: 0.4;
    }
    100%{
        opacity: 0.2;
    }
}

.dot:nth-child(1){
    background-color: rgb(128, 203, 226);
}
.dot:nth-child(2){
    background-color: rgb(70, 96, 243);
    animation-delay: 0.2s;
}
.dot:nth-child(3){
    background-color: rgb(53, 82, 209);
    animation-delay: 0.4s;
}
.dot:nth-child(4){
    background-color: rgb(4, 69, 153);
    animation-delay: 0.6s;
}

</style>