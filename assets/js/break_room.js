let BreakRoom = {
    init(socket){
        let channel = socket.channel('break_room:lobby', {})
        channel.join()
        this.listenForChats(channel)
    },


    listenForChats(channel) {
        document.getElementById('chat-form').addEventListener('submit', function(e){
            e.preventDefault()

            let userName = document.getElementById('user-name').value
            let userMsg = document.getElementById('user-msg').value
            
            channel.push('new_message', {name: userName, message: userMsg})

            document.getElementById('user-name').value = ''
            document.getElementById('user-msg').value = ''


        })

        channel.on("new_message", payload => {
            let chatBox = document.querySelector('#chat-box')
            let msgBlock = document.createElement('p')

            msgBlock.insertAdjacentHTML('beforeend', `<b>${payload.name}:</b> ${payload.message}`)
            chatBox.appendChild(msgBlock)
        })
    }
}


export default BreakRoom