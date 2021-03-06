/* tslint:disable:no-console */
import Fluvio from '../src/index'
import { v4 as uuidV4 } from 'uuid'

console.log('connecting client to sc')

async function createManagedSpu() {
    try {
        const fluvio = new Fluvio()

        // Explicitly call `.connect()` to connect to the cluster;
        // This allows for lazily-loading the connection, useful in
        // situations where the fluvio client does not need to immediately
        // connect.
        await fluvio.connect()

        // Set the admin client;
        const admin = await fluvio.admin()

        const spuName = uuidV4()

        // create managed spu
        // If you want to use defaults from above, you can leave
        // the spec undefined and it will generate a default spec;
        //
        // Otherwise, a developer can generate a new spec using
        // new SpuGroupSpec({ ...options })
        await admin.createManagedSpu(spuName)

        console.log('managed spu created')
    } catch (ex) {
        console.log('problem creating spu', ex)
    }
}

createManagedSpu()
