/* tslint:disable:no-console */
import Fluvio from '../src/index'

console.log('connecting client to sc')

async function deleteManagedSpu() {
    try {
        const fluvio = new Fluvio()

        // Explicitly call `.connect()` to connect to the cluster;
        // This allows for lazily-loading the connection, useful in
        // situations where the fluvio client does not need to immediately
        // connect.
        await fluvio.connect()

        // Set the admin client;
        const admin = await fluvio.admin()

        const spuName = 'my-spu'

        // delete managed spu
        await admin.deleteManagedSpu(spuName)

        console.log('deleted managed spu')
    } catch (ex) {
        console.log('problem deleting spu', ex)
    }
}

deleteManagedSpu()
